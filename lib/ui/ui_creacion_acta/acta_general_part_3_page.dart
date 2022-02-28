import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/const/Strings.dart';
import 'package:app_licman/model/inspeccion.dart';
import 'package:app_licman/model/state/commonVarState.dart';
import 'package:app_licman/model/state/equipoState.dart';

import 'package:app_licman/services/generate_image_url.dart';
import 'package:app_licman/services/inspeccion_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:http/http.dart' as http;

import '../../model/state/actaState.dart';

class ActaGeneralPartThree extends StatefulWidget {
  const ActaGeneralPartThree({Key? key}) : super(key: key);

  @override
  _ActaGeneralPartThreeState createState() => _ActaGeneralPartThreeState();
}

class _ActaGeneralPartThreeState extends State<ActaGeneralPartThree>
    with AutomaticKeepAliveClientMixin {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );
  var activar = false;
  @override
  bool get wantKeepAlive => true; //

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Signature(
                controller: _controller,
                height: 300,
                backgroundColor: Colors.white,
              ),
              if (activar)
                Container(
                  height: 300,
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

                    Inspeccion acta = Provider.of<ActaState>(context,listen: false).convertMapToObject("adfas.com");
                    log(acta.toJson().toString());
                    final result = await sendActa(acta);
                    if(result != null){
                      Provider.of<EquipoState>(context,listen: false).addActa(result);
                      Provider.of<EquipoState>(context,listen: false).setHorometro(acta.idEquipo!,acta.horometroActual!);
                      Provider.of<CommonState>(context,listen: false).changeActaIndex(0);
                      Navigator.pop(context);

                    }


                    /*
                    final Uint8List? data = await _controller.toPngBytes();
                    //enviar la foto
                    GenerateImageUrl generateImageUrl = GenerateImageUrl();
                    await generateImageUrl.call(".png");

                    print(generateImageUrl.uploadUrl);

                    String uploadUrl;
                    if (generateImageUrl.isGenerated != null &&
                        generateImageUrl.isGenerated!) {

                      uploadUrl = generateImageUrl.uploadUrl!;

                    } else {
                      throw generateImageUrl.message!;
                    }
                    Uint8List imageInUnit8List = data!;
                    final tempDir = await getTemporaryDirectory();

                    File file =
                    await File('${tempDir.path}/image.png').create();
                    file.writeAsBytesSync(imageInUnit8List);

                    var response = await http.put(Uri.parse(uploadUrl),
                        body: file.readAsBytesSync());


                    print(response.body);





                    sendBody["firmaURL"] = generateImageUrl.downloadUrl!;
                   // sendBody["firmaURL"] ="as.com";
                    log(sendBody.toString());

                    final result = await makePostRequest(Strings.urlServerPostInps,sendBody);
                     if(result != null){
                      Provider.of<EquipoState>(context,listen: false).addActa(result);
                      Provider.of<EquipoState>(context,listen: false).setHorometro(int.parse(providerVar.id),int.parse(providerVar.horometroActual));
                      Provider.of<CommonState>(context,listen: false).changeActaIndex(0);
                      Navigator.pop(context);

                    }

                     */




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
    );
  }
}

Future<bool> uploadFile(context, String url, File image) async {
  try {
    UploadFile uploadFile = UploadFile();
    await uploadFile.call(url, image);

    return true;
  } catch (e) {
    print(e);
    throw e;
  }
}
