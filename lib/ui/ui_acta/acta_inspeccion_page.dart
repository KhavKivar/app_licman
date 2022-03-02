import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/state/actaState.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui_creacion_acta/acta_page_view.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.tipo}) : super(key: key);
  final bool tipo;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _value = false;
  var allValue = null;
  final PageController controller = PageController();

  TextEditingController? espejosController;
  TextEditingController? focosDelanterosController;
  TextEditingController? focosTraserosController;
  TextEditingController? llaveController;
  TextEditingController? intermitentesDelanterosController;
  TextEditingController? intermitentesTraserosController;
  TextEditingController? ruedasController;

  TextEditingController? alturaLevanteController;
  late final newFieldsMap;

  late final controller_map;

  @override
  void initState() {
    super.initState();

    espejosController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["Espejos"]);
    focosDelanterosController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["Focos faeneros delanteros"]);
    focosTraserosController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["Focos faeneros traseros"]);

    llaveController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["LLave de contacto"]);
    intermitentesDelanterosController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["Intermitentes delanteros"]);
    intermitentesTraserosController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["Intermitentes traseros"]);
    ruedasController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
            ['TEXT_CAMP']["Ruedas"]);

    controller_map = {
      'Espejos': [
        espejosController,
        Provider.of<ActaState>(context, listen: false).setEspejos
      ],
      'Focos faeneros delanteros': [
        focosDelanterosController,
        Provider.of<ActaState>(context, listen: false).setFocosD
      ],
      'Focos faeneros traseros': [
        focosTraserosController,
        Provider.of<ActaState>(context, listen: false).setFocosT
      ],
      'LLave de contacto': [
        llaveController,
        Provider.of<ActaState>(context, listen: false).setLlave
      ],
      'Intermitentes delanteros': [
        intermitentesDelanterosController,
        Provider.of<ActaState>(context, listen: false).setInterD
      ],
      'Intermitentes traseros': [
        intermitentesTraserosController,
        Provider.of<ActaState>(context, listen: false).setInterT
      ],
      'Ruedas': [
        ruedasController,
        Provider.of<ActaState>(context, listen: false).setRuedas
      ],
    };
  }

  @override
  void dispose() {
    espejosController?.dispose();
    focosDelanterosController?.dispose();
    focosTraserosController?.dispose();
    llaveController?.dispose();
    intermitentesDelanterosController?.dispose();
    intermitentesTraserosController?.dispose();
    ruedasController?.dispose();
    super.dispose();
  }

  List<String> itemsTitle = [
    "ACCESORIOS",
    "SISTEMA HIDRAULICO",
    "SISTEMA ELECTRICO",
    "CHASIS ESTRUCTURA",
    "PRUEBAS DE OPERACION"
  ];
  Map<String,int> itemsTitlePosition = {
    "ACCESORIOS":0,
    "SISTEMA HIDRAULICO":1,
    "SISTEMA ELECTRICO":2,
    "CHASIS ESTRUCTURA":3,
    "PRUEBAS DE OPERACION":4
  };
  String dropdownValue = 'ACCESORIOS';
  Map<String,IconData> itemsIconsDic = {
    "ACCESORIOS":Icons.assignment,
    "SISTEMA HIDRAULICO":Icons.biotech,
    "SISTEMA ELECTRICO":  Icons.electrical_services,
    "CHASIS ESTRUCTURA":Icons.directions_car,
    "PRUEBAS DE OPERACION": Icons.speed,


  };

  List<IconData> itemsIcons = [
    Icons.assignment,
    Icons.biotech,
    Icons.electrical_services,
    Icons.directions_car,
    Icons.speed,
  ];

  final double fontSizeTextHeader = 18;
  final double fontSizeTextRow = 19;
  var selectPage = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    allValue =
        Provider.of<ActaState>(context).MapOfValue['ACTA']['SELECT_CAMP'];

    print(Provider.of<ActaState>(context).MapOfValue['ACTA']['OPTION_SELECT']);



    return SafeArea(
      child: Scaffold(
          body: allValue == null
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
              : Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: dark,

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: dark,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_downward,color: Colors.white,),
                                    elevation: 8,
                                    underline: Container(
                                    height: 0,
                                    color: Colors.blueAccent,
                                   ),
                                    style: const TextStyle(color: Colors.white,fontSize: 23),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                        setState(() {
                                          controller.animateToPage(itemsTitlePosition[newValue]!,
                                              duration: Duration(milliseconds: 400),
                                              curve: Curves.easeInOut);
                                          selectPage = itemsTitlePosition[newValue]!;
                                        });
                                      });
                                    },
                                    items: itemsTitle
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            Icon(itemsIconsDic[value],color: Colors.white,size: 30,),
                                            const SizedBox(width: 10,),
                                            Text(value),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                          itemCount: allValue.length,
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller,
                          itemBuilder: (context, position) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: allValue[position].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String key = allValue[position]
                                          .keys
                                          .elementAt(index);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.7)),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:Alignment.topLeft,
                                                    child: FittedBox(
                                                      fit:BoxFit.scaleDown,
                                                      child: Row(children: [
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          key,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  fontSizeTextRow),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                                RenderSpecialFields(
                                                  tipo: widget.tipo,
                                                  keyMap: key,
                                                ),
                                                Provider.of<ActaState>(context,
                                                                    listen: false)
                                                                .MapOfValue['ACTA']
                                                            [
                                                            'TEXT_CAMP'][key] !=
                                                        null
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        child: Container(
                                                          width: 90,

                                                          child: TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                controller_map[
                                                                    key][0],
                                                            onChanged:
                                                                controller_map[
                                                                    key][1],
                                                            decoration:
                                                                InputDecoration(
                                                                    isDense: true, // important line
                                                                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true,
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1.0),
                                                              ),
                                                              enabledBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            2),
                                                              ),
                                                              hintText:
                                                                  'cantidad...',
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                                CheckBoxWidget(
                                                  fontSizeTextHeader:
                                                      fontSizeTextHeader,
                                                  allValue: allValue,
                                                  TextHeader: 'Bueno',
                                                  PositionArray: 0,
                                                  index: index,
                                                  position: position,
                                                  keyR: key,
                                                ),
                                                CheckBoxWidget(
                                                  fontSizeTextHeader:
                                                      fontSizeTextHeader,
                                                  allValue: allValue,
                                                  TextHeader: 'Regular',
                                                  PositionArray: 1,
                                                  index: index,
                                                  position: position,
                                                  keyR: key,
                                                ),
                                                CheckBoxWidget(
                                                  fontSizeTextHeader:
                                                      fontSizeTextHeader,
                                                  allValue: allValue,
                                                  TextHeader: 'Malo',
                                                  PositionArray: 2,
                                                  index: index,
                                                  position: position,
                                                  keyR: key,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                )),
    );
  }
}
/**
 *
 *
 *
 * */

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {required this.fontSizeTextHeader,
      required this.allValue,
      required this.position,
      required this.keyR,
      required this.TextHeader,
      required this.PositionArray,
      required this.index})
      : super();
  final String TextHeader;

  final double fontSizeTextHeader;
  final allValue;
  final int position;
  final String keyR;

  final int PositionArray;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        children: [
          if (index == 0)
            Text(
              TextHeader,
              style: TextStyle(fontSize: fontSizeTextHeader),
            ),
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
                value: allValue[position][keyR]![PositionArray],
                onChanged: (bool? value) {
                  if (allValue[position][keyR]!.contains(true)) {
                    int indexl = allValue[position][keyR]!
                        .indexWhere((element) => element == true);
                    allValue[position][keyR]![indexl] = false;
                  }
                  //Change all value
                  if (index == 0) {
                    Provider.of<ActaState>(context, listen: false)
                        .changeAllColumn(position, PositionArray, value!);
                  } else {
                    Provider.of<ActaState>(context, listen: false)
                        .setValue(position, keyR, PositionArray, value!);
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class RenderSpecialFields extends StatefulWidget {
  const RenderSpecialFields(
      {Key? key, required this.keyMap, required this.tipo})
      : super(key: key);
  final keyMap;
  final bool tipo;
  @override
  _RenderSpecialFieldsState createState() => _RenderSpecialFieldsState();
}

class _RenderSpecialFieldsState extends State<RenderSpecialFields> {
  late final mapSetFunct;
  late final provider;
  late final data;

  TextEditingController? bateriaController;
  TextEditingController? serieController;
  late final listController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var provider = Provider.of<ActaState>(context, listen: false);

    data = Provider.of<ActaState>(context, listen: false).MapOfValue['ACTA']
        ['OPTION_SELECT'];
    print(widget.tipo.toString());
    if (widget.tipo) {
      mapSetFunct = {
        "Arnes de cilindro de gas": provider.setFieldSpecialArnes,
        'Carro y su respaldo de carga': provider.setFieldSpecialRespaldoEquipo,
      };
      listController = {};
    } else {
      mapSetFunct = {
        'Carro y su respaldo de carga':
            provider.setFieldSpecialRespaldoElectrico,
        'Bateria': provider.setFieldSpecialBateria,
        'Serie cargador': provider.setFieldSerieCargador,
        'Cargador voltaje y amperaje': provider.setFieldSpecialCargadorVoltaje,
        'Enchufes': provider.setFiedlsSpecialEnchufe,
      };
      bateriaController = TextEditingController(
          text: Provider.of<ActaState>(context, listen: false)
              .MapOfValue['ACTA']['OPTION_SELECT']['Bateria']
              .select);
      serieController = TextEditingController(
          text: Provider.of<ActaState>(context, listen: false)
              .MapOfValue['ACTA']['OPTION_SELECT']['Serie cargador']
              .select);
      listController = {
        'Serie cargador': serieController,
        'Bateria': bateriaController,
      };
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return data[widget.keyMap] != null
        ? data[widget.keyMap].tipo == "select"
            ? Row(
                children: [
                  Text(data[widget.keyMap].text),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    value: data[widget.keyMap].select,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blueAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String? newValue) {
                      mapSetFunct[widget.keyMap](newValue);
                    },
                    items: data[widget.keyMap]
                        .options
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: listController[widget.keyMap],
                    onChanged: (value) {
                      mapSetFunct[widget.keyMap](value);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                        isDense: true, // important line
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black12, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      hintText: data[widget.keyMap].text,
                    ),
                  ),
                ),
              )
        : Container();
  }
}
