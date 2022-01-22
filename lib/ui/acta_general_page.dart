import 'package:app_licman/model/equipo.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/ui/signature_page.dart';
import 'package:app_licman/widget/details_equipo_widget.dart';
import 'package:app_licman/widget/tipo_acta_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import 'acta_inspeccion_page.dart';

class ActaGeneral extends StatefulWidget {
  const ActaGeneral({Key? key}) : super(key: key);

  @override
  _ActaGeneralState createState() => _ActaGeneralState();
}

class _ActaGeneralState extends State<ActaGeneral> {
  late final equiposStateProvider;
  final TextEditingController? _typeAheadController = TextEditingController();
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.white,
    exportBackgroundColor: Colors.black,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );
  Equipo? equipoSelect = null;

  @override
  void initState() {
    super.initState();
    equiposStateProvider = Provider.of<EquipoState>(context, listen: false);
    equiposStateProvider.initState(context);
  }

  final double fontSizeTextRow = 19;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Acta de inspeccion")),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            
            width: width * 0.8,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "ACTA DE INSPECCION",
                  style: TextStyle(fontSize: 30),
                ),
                Column(
                  children: [
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _typeAheadController,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.assignment,
                              color: Colors.blue,
                            ),
                            hintText: 'Codigo interno',
                          )),
                      suggestionsCallback: (pattern) async {
                        List<Equipo> equipos = equiposStateProvider.getEquipo();
                        List<String> suggestCodigo = [];
                        for (int i = 0; i < equipos.length; i++) {
                          suggestCodigo.add(equipos[i].id.toString());
                        }
                        return suggestCodigo
                            .where((element) => element
                                .toString()
                                .contains(pattern.toString().toLowerCase()))
                            .toList();
                      },
                      itemBuilder: (context, suggestion) {
                        List<Equipo> equipos = equiposStateProvider.getEquipo();
                        int index = equipos.lastIndexWhere(
                            (element) => element.id.toString() == suggestion);

                        return ListTile(
                          leading: Icon(
                            Icons.assignment,
                            size: 52.0,
                            color: Colors.blue,
                          ),
                          title: Text("Numero interno: " + suggestion.toString()),
                          subtitle: Text("Tipo: " +
                              equipos[index].tipo.toString() +
                              "\n" +
                              "Marca: " +
                              equipos[index].marca.toString() +
                              "\n" +
                              "Modelo: " +
                              equipos[index].modelo.toString() +
                              "\n" +
                              "Serie: " +
                              equipos[index].serie.toString()),
                          isThreeLine: true,
                        );
                      },
                      onSuggestionSelected: (String suggestion) {
                        List<Equipo> equipos = equiposStateProvider.getEquipo();
                        _typeAheadController?.text = suggestion;
                        equipoSelect = equipos.firstWhere((element) =>
                            element.id.toString() == suggestion.toString());
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (equipoSelect != null)
                      Column(
                        children: [
                          DetalleEquipoWidget(fontSizeTextRow: fontSizeTextRow, equipoSelect: equipoSelect!,),
                          TipoActaWidget(),



                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*

  Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child:  Signature(

                                  height: height*0.4,

                                  backgroundColor: Colors.black, controller: _controller),
                                ),
                              const SizedBox(width: 30,),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent,
                                              width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        hintText: 'Rut',
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        hintText: 'Nombre recepcionista',
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
* */
