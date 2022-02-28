import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/inspeccion.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/plugins/dart_rut_form.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

import 'ui_acta/acta_only_view_page.dart';
import 'ui_creacion_acta/acta_page_view.dart';

class TableOfActas extends StatefulWidget {
  const TableOfActas({Key? key}) : super(key: key);

  @override
  _TableOfActasState createState() => _TableOfActasState();
}

class _TableOfActasState extends State<TableOfActas> {
  final fontSizeRowTable = 20.0;
  final fontSizeRowHead = 25.0;
  DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
  final searchController = TextEditingController();
  List<Inspeccion> filterList = [];
  List<Inspeccion> inspecciones = [];
  var showFilter = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    inspecciones =
        Provider.of<EquipoState>(context, listen: false).inspeccionList;
    filterList = [...inspecciones];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActaPageView()),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: (!showFilter)
                          ? BorderRadius.all(Radius.circular(5))
                          : BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                      color: Colors.white),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar acta..',
                      hintStyle: TextStyle(fontSize: 21),
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showFilter = !showFilter;
                            });
                          },
                          icon: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.black,
                            size: 25,
                          )),
                    ),
                    onChanged: (value) {
                      print(value);

                      setState(() {
                        filterList = inspecciones
                            .where((element) => element.idEquipo
                                .toString()
                                .startsWith(value.toLowerCase()))
                            .toList();
                        print(filterList);
                      });
                      /*
                           element.idInspeccion.toString().startsWith(value.toLowerCase())
                              ||

                              ||
                              element.rut!.startsWith(value.toLowerCase())||
                              RUTValidator.deFormat(element.rut!).startsWith(value.toLowerCase())

                        * */
                    },
                  ),
                ),
                if (showFilter)
                  Column(
                    children: [
                      const Divider(
                        height: 0.3,
                        thickness: 0.6,
                        color: Colors.black87,
                      ),
                      FilterPanelWidget(),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        constraints: BoxConstraints(minWidth: width - 100),
                        child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: true,
                          headingRowColor:
                              MaterialStateColor.resolveWith((states) => dark),
                          rows: [
                            for (int i = 0; i < filterList.length; i++)
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    filterList[i].idInspeccion.toString(),
                                    style:
                                        TextStyle(fontSize: fontSizeRowTable),
                                  )),
                                  DataCell(Text(
                                    filterList[i].idEquipo.toString(),
                                    style:
                                        TextStyle(fontSize: fontSizeRowTable),
                                  )),
                                  DataCell(Text(
                                    RUTValidator.formatFromText(
                                        filterList[i].rut!),
                                    style:
                                        TextStyle(fontSize: fontSizeRowTable),
                                  )),
                                  DataCell(Text(
                                    filterList[i]
                                            .alturaLevante
                                            .toString()
                                            .replaceAll(".", ",") +
                                        " Milimetros",
                                    style:
                                        TextStyle(fontSize: fontSizeRowTable),
                                  )),
                                  DataCell(Text(
                                    formatter.format(filterList[i].ts!),
                                    style:
                                        TextStyle(fontSize: fontSizeRowTable),
                                  )),
                                  DataCell(IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActaOnlyView(
                                                      inspeccion:
                                                          filterList[i])));
                                    },
                                  )),
                                ],
                              ),
                          ],
                          columns: [
                            DataColumn(
                              label: Text(
                                'Acta ID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeRowHead),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Equipo ID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeRowHead),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Rut cliente',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeRowHead),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Altura de levante',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeRowHead),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Fecha',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeRowHead),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Ver',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSizeRowHead),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterPanelWidget extends StatefulWidget {
  const FilterPanelWidget({Key? key}) : super(key: key);

  @override
  _FilterPanelWidgetState createState() => _FilterPanelWidgetState();
}

class _FilterPanelWidgetState extends State<FilterPanelWidget> {
  final List<String> _categoriesOption = [
    'Acta ID',
    'ID Equipo',
    'Rut cliente',
    'Altura de levante',
    'Fecha',

  ];
   List<int> _categories=[0];
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        ),
        child: Row(children: [
          Expanded(
            child: SmartSelect<int>.multiple(
                title: 'Filtro por campo',
                modalTitle: 'Campo',
                modalType: S2ModalType.fullPage,
                choiceType: S2ChoiceType.checkboxes,
                choiceItems: S2Choice.listFrom<int, String>(
                  source: _categoriesOption,
                  value: (index, item) => index,
                  title: (index, item) => item,
                ),
                choiceStyle: const S2ChoiceStyle(
                  color: Colors.black,

                ),
                value: _categories,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    trailing: const Icon(Icons.arrow_drop_down),
                    isTwoLine: true,
                  );
                },
                onChange: (state) {}),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.black,
            ),
          )
        ]));
  }
}
