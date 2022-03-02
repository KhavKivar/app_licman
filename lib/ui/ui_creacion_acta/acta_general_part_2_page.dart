import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/state/actaState.dart';
import 'package:http/http.dart' as http;
import 'package:app_licman/plugins/dart_rut_form.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import '../../model/cola.dart';
import '../../model/inspeccion.dart';
import '../../model/state/commonVarState.dart';
import '../../model/state/equipoState.dart';
import '../../services/generate_image_url.dart';
import '../../services/inspeccion_services.dart';
import '../../services/util.dart';

class actaGeneralPartTwo extends StatefulWidget {
  const actaGeneralPartTwo({Key? key}) : super(key: key);

  @override
  _actaGeneralPartTwoState createState() => _actaGeneralPartTwoState();
}

class _actaGeneralPartTwoState extends State<actaGeneralPartTwo>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; //
  TextEditingController? rutController;
  TextEditingController? nameController;
  TextEditingController? obvController;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );
  var activar = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
    rutController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['rut']);
    nameController = TextEditingController(
        text:
            Provider.of<ActaState>(context, listen: false).MapOfValue['name']);
    obvController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['obv']);
  }

  @override
  void dispose() {
    super.dispose();
    rutController?.dispose();
    nameController?.dispose();
    obvController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: rutController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|k')),
                    ],
                    onChanged: (value) {
                      Provider.of<ActaState>(context, listen: false)
                          .setRut(value);
                      RUTValidator.formatFromTextController(rutController!);
                    },
                    style: TextStyle(color: dark, fontSize: 23),
                    keyboardType: TextInputType.name,
                    maxLength: 12,
                    decoration: const InputDecoration(
                        counterText: '',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Rut',
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    onChanged: Provider.of<ActaState>(context).setName,
                    style: TextStyle(color: dark, fontSize: 23),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Nombre recepcionista',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.text,
              controller: obvController,
              onChanged: Provider.of<ActaState>(context).setObv,
              style: TextStyle(color: dark, fontSize: 23),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Observaciones',
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Signature(
                  controller: _controller,
                  height: 250,
                  backgroundColor: Colors.white,
                ),
                if (activar)
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0),
                  ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: dark,
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //SHOW EXPORTED IMAGE IN NEW ROUTE
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.white,
                    onPressed: () async {
                      if (_controller.isNotEmpty) {
                        final Uint8List? data = await _controller.toPngBytes();

                        if (data != null) {
                          setState(() {
                            activar = true;
                          });
                        }
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.undo),
                    color: Colors.white,
                    onPressed: () {
                      setState(() => _controller.undo());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.redo),
                    color: Colors.white,
                    onPressed: () {
                      setState(() => _controller.redo());
                    },
                  ),
                  //CLEAR CANVAS
                  IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        activar = false;
                        _controller.clear();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () async {
                      bool internetOn = await checkConnectivity();

                      if (internetOn) {
                        enviarActaOnline();
                      } else {
                        enviarActaOffline();
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Future<String> getUrlImg() async {
    try {
      final Uint8List? data = await _controller.toPngBytes();

      //enviar la foto
      GenerateImageUrl generateImageUrl = GenerateImageUrl();
      await generateImageUrl.call(".png");

      String uploadUrl;
      if (generateImageUrl.isGenerated != null &&
          generateImageUrl.isGenerated!) {
        uploadUrl = generateImageUrl.uploadUrl!;
      } else {
        throw generateImageUrl.message!;
      }


      Uint8List imageInUnit8List = data!;
      final tempDir = await getTemporaryDirectory();

      File file = await File('${tempDir.path}/image.png').create();
      file.writeAsBytesSync(imageInUnit8List);
      var response =
          await http.put(Uri.parse(uploadUrl), body: file.readAsBytesSync());

      return generateImageUrl.downloadUrl!;
    } catch (e) {

      return "";
    }
  }

  Future<void> enviarActaOnline() async {
    String urlImg = await getUrlImg();
    Inspeccion acta = Provider.of<ActaState>(context, listen: false)
        .convertMapToObject(urlImg);
    final result = await sendActa(acta);
    if (result != null) {
      Provider.of<EquipoState>(context, listen: false).addActa(result);
      Provider.of<EquipoState>(context, listen: false)
          .setHorometro(acta.idEquipo!, acta.horometroActual!);
      Provider.of<CommonState>(context, listen: false).changeActaIndex(0);
      Navigator.pop(context);
    } else {
      enviarActaOffline();
    }


  }

  Future<void> enviarActaOffline() async {
    final Uint8List? data = await _controller.toPngBytes();
    var box = await Hive.openBox('cola');
    Inspeccion acta = Provider.of<ActaState>(context, listen: false)
        .convertMapToObject("");

    DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    String now =   formatter.format(DateTime.now()); // 30/09/2021 15:54:30
    Cola cola = Cola(acta, now, "SIN ENVIAR", data);
    box.add(cola);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Row(
        children: [
          Icon(Icons.dangerous,color: Colors.red,),
          const SizedBox(width:5),
          Text('Sin conexion a internet, se envio a la cola de actas',style:TextStyle(fontSize: 18)),
        ],
      ),
    ));
    Provider.of<EquipoState>(context,listen: false).addCola(cola);
    Navigator.pop(context);

  }
}
