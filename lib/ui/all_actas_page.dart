import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/inspeccion.dart';
import 'package:app_licman/model/state/commonVarState.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/plugins/dart_rut_form.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:app_licman/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

import '../model/movimiento.dart';
import '../model/state/actaState.dart';
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
  final searchMovController = TextEditingController();
  List<Inspeccion> filterList = [];
  List<Inspeccion> inspecciones = [];
  List<Movimiento> movFilterList = [];
  var showFilter = false;

  int select = 0;

  double fontSizeNav = 25.0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    inspecciones = Provider.of<EquipoState>(context).inspeccionList;
    movimientos = Provider.of<EquipoState>(context).movimientos;
    filterList = [...inspecciones];
    movFilterList = [...movimientos];
  }

  @override
  void initState() {
    super.initState();
  }

  String dropdownValue = 'Actas';
  List<String> itemsTitle = [
    "Actas",
    "Movimientos",
  ];
  Map<String, IconData> itemsIcons = {
    "Actas": Icons.content_paste,
    "Movimientos": Icons.swap_vert,
  };
  int? sortColumnIndex;
  void onSort(int columnIndex, bool ascending) {
    Map<int, String> columnsTable = {
      0: 'Acta Id',
      1: 'ID equipo',
      2: 'Rut cliente',
      3: 'Altura de levante',
      4: 'Fecha'
    };
    List<int> listaActual =
        Provider.of<CommonState>(context, listen: false).categories;
    setState(() {
      if (columnIndex == 0) {
        filterList.sort((x1, x2) =>
            compareString(ascending, x1.idInspeccion!, x2.idInspeccion!));
      }
    });
  }

  int compareString(bool ascending, int value1, int value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(2);
  }

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var provSelectState = Provider.of<CommonState>(context).categories;

    return Scaffold(
      appBar: AppBar(
        title: Text("Actas y movimientos"),
        backgroundColor: dark,
      ),
      drawer: MyDrawer(),
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
            ).then((value) {
              print("iscalled");
              Provider.of<CommonState>(context, listen: false)
                  .changeActaIndex(0);
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          select = 0;
                          controller.animateToPage(0,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: select == 0 ? Colors.blueAccent : dark,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              )),
                          child: RowNavigator(
                            iconData: Icons.content_paste,
                            title: "Actas",
                            fontSizeText: fontSizeNav,
                          )),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          select = 1;
                        });
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: select == 1 ? Colors.blueAccent : dark,
                          ),
                          child: RowNavigator(
                            iconData: Icons.swap_vert,
                            title: "Movimientos",
                            fontSizeText: fontSizeNav,
                          )),
                    )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ActaWidget(provSelectState, width),
                  MovimientoWidget(width)

                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  List<Movimiento> movimientos = [];

  Widget MovimientoWidget(width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: (!showFilter)
                    ? BorderRadius.all(Radius.circular(25))
                    : BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                color: Colors.white),
            child: TextField(
              controller: searchMovController,
              decoration: InputDecoration(
                hintText: 'Buscar movimientos..',
                hintStyle: TextStyle(fontSize: 21),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showFilter = !showFilter;
                      });
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: dark,
                      size: 25,
                    )),
              ),
              onChanged: (value) {
                movFilterList = movimientos
                    .where((element) => element.idMovimiento
                    .toString()
                    .startsWith(value.toLowerCase()))
                    .toList();
                setState(() {

                });
                print(value);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    constraints: BoxConstraints(minWidth: width - 50),
                    child: DataTable(
                        dataRowHeight: 70,
                        showBottomBorder: true,
                        sortColumnIndex: 0,
                        sortAscending: false,
                        headingRowColor:
                            MaterialStateColor.resolveWith((states) => dark),
                        rows: [
                          for (int i = 0; i < movFilterList.length; i++)
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                  formatter.format(movFilterList[i].fechaMov),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  movFilterList[i].idMovimiento.toString(),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  movFilterList[i].transporte,
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  RUTValidator.formatFromText(
                                      movFilterList[i].rut),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  movFilterList[i].tipo,
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  movFilterList[i].idInspeccion.toString(),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  movFilterList[i].idGuiaDespacho.toString(),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                  movFilterList[i].cambio == null ? "":movFilterList[i].cambio.toString(),
                                  style:
                                  TextStyle(fontSize: fontSizeRowTable),
                                )),
                                DataCell(Text(
                                    movFilterList[i].fechaRetiro == null ? "":
                                    formatter
                                      .format(movFilterList[i].fechaRetiro!),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                              ],
                            ),
                        ],
                        columns: [
                          DataColumn(
                            label: Text(
                              'Fecha de movimiento',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Movimiento ID',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Transporte',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Rut Empresa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Tipo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead ),
                            ),
                          ),
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
                              'N° Guia',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Cambio',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Fecha de retiro',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ActaWidget(provSelectState, width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: (!showFilter)
                    ? BorderRadius.all(Radius.circular(25))
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
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showFilter = !showFilter;
                      });
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: dark,
                      size: 25,
                    )),
              ),
              onChanged: (value) {
                print(value);

                setState(() {
                  filterList = inspecciones;
                  var filtros =
                      Provider.of<CommonState>(context, listen: false)
                          .listaFiltro;

                  switch (filtros) {
                    case 0:
                      {
                        filterList = filterList
                            .where((element) => element.idInspeccion
                                .toString()
                                .startsWith(value.toLowerCase()))
                            .toList();
                      }
                      break;
                    case 1:
                      {
                        filterList = filterList
                            .where((element) => element.idEquipo
                                .toString()
                                .startsWith(value.toLowerCase()))
                            .toList();
                      }
                      break;
                    case 2:
                      {
                        filterList = filterList
                            .where((element) =>
                                element.rut!
                                    .startsWith(value.toLowerCase()) ||
                                RUTValidator.deFormat(element.rut!)
                                    .startsWith(value.toLowerCase()))
                            .toList();
                      }
                      break;

                    case 3:
                      {
                        filterList = filterList
                            .where((element) => element.ts
                                .toString()
                                .startsWith(value.toLowerCase()))
                            .toList();
                      }
                      break;
                  }
                });
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
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    constraints: BoxConstraints(minWidth: width - 50),
                    child: DataTable(
                      sortColumnIndex: sortColumnIndex,
                      sortAscending: true,
                      headingRowColor:
                          MaterialStateColor.resolveWith((states) => dark),
                      rows: [
                        for (int i = 0; i < filterList.length; i++)
                          DataRow(
                            cells: <DataCell>[
                              if (provSelectState.contains(0))
                                DataCell(Text(
                                  filterList[i].idInspeccion.toString(),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                              if (provSelectState.contains(1))
                                DataCell(Text(
                                  filterList[i].idEquipo.toString(),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                              if (provSelectState.contains(2))
                                DataCell(Text(
                                  RUTValidator.formatFromText(
                                      filterList[i].rut!),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                              if (provSelectState.contains(3))
                                DataCell(Text(
                                  filterList[i]
                                          .alturaLevante
                                          .toString()
                                          .replaceAll(".", ",") +
                                      " Milimetros",
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                              if (provSelectState.contains(4))
                                DataCell(Text(
                                  formatter.format(filterList[i].ts!),
                                  style:
                                      TextStyle(fontSize: fontSizeRowTable),
                                )),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove_red_eye_rounded),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActaOnlyView(
                                                      inspeccion:
                                                          filterList[i])));
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Inspeccion acta = inspecciones[i];
                                        Provider.of<ActaState>(context,
                                                listen: false)
                                            .convertObjectTostate(
                                                acta, context);
                                        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ActaPageView(
                                                            edit: true,
                                                            id: acta
                                                                .idInspeccion)))
                                            .then((value) {
                                          Provider.of<CommonState>(context,
                                                  listen: false)
                                              .changeActaIndex(0);
                                        });
                                      },
                                      icon: Icon(Icons.edit_sharp)),
                                ],
                              )),
                            ],
                          ),
                      ],
                      columns: [
                        if (provSelectState.contains(0))
                          DataColumn(
                            label: Text(
                              'Acta ID',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                        if (provSelectState.contains(1))
                          DataColumn(
                            label: Text(
                              'Equipo ID',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                        if (provSelectState.contains(2))
                          DataColumn(
                            onSort: onSort,
                            label: Text(
                              'Rut cliente',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                        if (provSelectState.contains(3))
                          DataColumn(
                            label: Text(
                              'Altura de levante',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeRowHead),
                            ),
                          ),
                        if (provSelectState.contains(4))
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
          ),
        ],
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

  final List<String> _filterOptions = [
    'Acta ID',
    'ID Equipo',
    'Rut cliente',
    'Fecha',
  ];
  List<int> _categories = [0];
  int _filtroBusqueda = 1;
  @override
  void initState() {
    _categories = Provider.of<CommonState>(context, listen: false).categories;
    _filtroBusqueda =
        Provider.of<CommonState>(context, listen: false).listaFiltro;
    super.initState();
  }

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
                title: 'Columnas',
                modalTitle: 'Mostrar/Ocultar columnas',
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
                modalHeaderStyle: S2ModalHeaderStyle(
                    iconTheme: IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    backgroundColor: dark,
                    textStyle: TextStyle(color: Colors.white)),
                modalStyle: const S2ModalStyle(backgroundColor: Colors.white),
                value: _categories,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    trailing: const Icon(Icons.arrow_drop_down),
                    isTwoLine: true,
                  );
                },
                onChange: (state) {
                  Provider.of<CommonState>(context, listen: false)
                      .changeSelectCategories(state.value);
                }),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              width: 9,
              thickness: 1,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: SmartSelect<int>.single(
                title: 'Filtros de busqueda',
                modalTitle: 'Filtros de busqueda',
                modalType: S2ModalType.popupDialog,
                choiceType: S2ChoiceType.chips,
                choiceItems: S2Choice.listFrom<int, String>(
                  source: _filterOptions,
                  value: (index, item) => index,
                  title: (index, item) => item,
                ),
                modalHeaderStyle: S2ModalHeaderStyle(
                    iconTheme: IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    backgroundColor: dark,
                    textStyle: TextStyle(color: Colors.white)),
                modalStyle: const S2ModalStyle(backgroundColor: Colors.white),
                choiceStyle: const S2ChoiceStyle(
                  color: Colors.black,
                ),
                value: _filtroBusqueda,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    trailing: const Icon(Icons.arrow_drop_down),
                    isTwoLine: true,
                  );
                },
                onChange: (state) {
                  Provider.of<CommonState>(context, listen: false)
                      .changeSelectFiltro(state.value);
                }),
          ),
        ]));
  }
}
