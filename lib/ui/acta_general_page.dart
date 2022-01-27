import 'dart:typed_data';

import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:app_licman/model/state/actaState.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/ui/signature_page.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:app_licman/widget/details_equipo_widget.dart';
import 'package:app_licman/widget/tipo_acta_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import 'acta_general_part_2_page.dart';
import 'acta_inspeccion_page.dart';

class ActaGeneral extends StatefulWidget {
  const ActaGeneral({Key? key}) : super(key: key);

  @override
  _ActaGeneralState createState() => _ActaGeneralState();
}

class _ActaGeneralState extends State<ActaGeneral> with AutomaticKeepAliveClientMixin  {
  late final equiposStateProvider;
  final TextEditingController? _typeAheadController = TextEditingController();

  Equipo? equipoSelect = null;

  @override
  void initState() {
    super.initState();

    equiposStateProvider = Provider.of<EquipoState>(context, listen: false);
  }

  final double fontSizeTextRow = 22;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Provider.of<EquipoState>(context).loading == true
          ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Loading"),
                ],
              ),
            )
          : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _typeAheadController,
                          style: TextStyle(color: dark, fontSize: 23),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.assignment,
                              color: dark,
                              size: 30,
                            ),
                            hintText: 'Codigo interno',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                            ),
                          )),
                      suggestionsCallback: (pattern) async {
                        List<Equipo> equipos =
                            equiposStateProvider.getEquipo();
                        List<String> suggestCodigo = [];
                        for (int i = 0; i < equipos.length; i++) {
                          suggestCodigo.add(equipos[i].id.toString());
                        }
                        return suggestCodigo
                            .where((element) => element
                                .toString()
                                .contains(
                                    pattern.toString().toLowerCase()))
                            .toList();
                      },
                      itemBuilder: (context, suggestion) {
                        List<Equipo> equipos =
                            equiposStateProvider.getEquipo();
                        int index = equipos.lastIndexWhere((element) =>
                            element.id.toString() == suggestion);

                        return ListTile(
                          leading: Icon(
                            Icons.assignment,
                            size: 52.0,
                            color: dark,
                          ),
                          title: Text(
                              "Numero interno: " + suggestion.toString()),
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
                        List<Equipo> equipos =
                            equiposStateProvider.getEquipo();
                        _typeAheadController?.text = suggestion;
                        equipoSelect = equipos.firstWhere((element) =>
                            element.id.toString() ==
                            suggestion.toString());
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (equipoSelect != null)
                      Column(
                        children: [
                          DetalleEquipoWidget(
                            fontSizeTextRow: fontSizeTextRow,
                            equipoSelect: equipoSelect!,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(

                              border: Border.all(color:Colors.grey,width: 2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.assignment,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text("Acta de inspeccion"),
                                  ),
                                ],
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: dark,
                                shadowColor: Colors.white,
                                elevation: 5,

                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
          );

  }

  @override
  bool get wantKeepAlive => true; //
}
/*


* */
