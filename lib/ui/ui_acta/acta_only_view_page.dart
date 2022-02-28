import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/inspeccion.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../ui_creacion_acta/acta_page_view.dart';

class ActaOnlyView extends StatefulWidget {
  const ActaOnlyView({Key? key, required this.inspeccion}) : super(key: key);
  final Inspeccion inspeccion;
  @override
  _ActaOnlyViewState createState() => _ActaOnlyViewState();
}

class _ActaOnlyViewState extends State<ActaOnlyView> {
  bool _value = false;

  final PageController controller = PageController();

  late final controller_map;
  var itemsFromTitle;
  late final newFieldsMap;
  late final itemSpecial;
  List<bool> convertStrinToBool(String param) {
    if (param == 'bueno') {
      return [true, false, false];
    } else if (param == 'regular') {
      return [false, true, false];
    }
    return [false, false, true];
  }

  @override
  void initState() {
    super.initState();

    itemSpecial = {
      'Espejos': widget.inspeccion.cantidadEspejos!,
      'Focos faeneros delanteros':
          widget.inspeccion.cantidadFocosFaenerosDelanteros!,
      'Focos faeneros traseros':
          widget.inspeccion.cantidadFocosFaenerosTraseros!,
      'LLave de contacto': widget.inspeccion.cantidadLlaveContacto!,
      'Intermitentes delanteros':
          widget.inspeccion.cantidadIntermitentesDelanteros!,
      'Intermitentes traseros':
          widget.inspeccion.cantidadIntermitentesTraseros!,
      'Ruedas': widget.inspeccion.cantidadRueda!,
    };

    if (widget.inspeccion.tipo == "acta_equipo") {
      newFieldsMap = {
        "Carro y su respaldo de carga": [
          "Respaldo de carga: ",
          widget.inspeccion.carga! == 1 ? "Si" : "No"
        ],
        "Arnes de cilindro de gas": [
          "Cilindro de gas: ",
          widget.inspeccion.cilindroDeGas == 1 ? "Si" : "No"
        ],
      };

      itemsFromTitle = {
        "ACCESORIOS": {
          '': [false, false, false],
          'Alarma retroceso':
              convertStrinToBool(widget.inspeccion.alarmaRetroceso!),
          'Asiento operdor':
              convertStrinToBool(widget.inspeccion.asientoOperador!),
          'Baliza': convertStrinToBool(widget.inspeccion.baliza!),
          'Bocina': convertStrinToBool(widget.inspeccion.bocina!),
          'Extintor': convertStrinToBool(widget.inspeccion.extintor!),
          'Espejos': convertStrinToBool(widget.inspeccion.espejos!),
          'Focos faeneros delanteros':
              convertStrinToBool(widget.inspeccion.focosFaenerosDelanteros!),
          "Focos faeneros traseros":
              convertStrinToBool(widget.inspeccion.focosFaenerosTraseros!),
          "LLave de contacto":
              convertStrinToBool(widget.inspeccion.llaveContacto!),
          "Intermitentes delanteros":
              convertStrinToBool(widget.inspeccion.intermitentesDelanteros!),
          "Intermitentes traseros":
              convertStrinToBool(widget.inspeccion.intermitentesTraseros!),
          "Palanca freno mano":
              convertStrinToBool(widget.inspeccion.palancaFrenoMano!),
          "Pera de volante": convertStrinToBool(widget.inspeccion.peraVolante!),
          "Arnes de cilindro de gas":
              convertStrinToBool(widget.inspeccion.arnesCilindroGas!),
          "Tablero instrumentos":
              convertStrinToBool(widget.inspeccion.tableroIntrumentos!),
        },
        "SISTEMA HIDRAULICO": {
          '': [false, false, false],
          "Cilindro desplazador":
              convertStrinToBool(widget.inspeccion.cilindroDesplazador!),
          "Cilindro direccion":
              convertStrinToBool(widget.inspeccion.cilindroDireccion!),
          "Cilindro levante central":
              convertStrinToBool(widget.inspeccion.cilindroLevanteCentral!),
          "Cilindro inclinacion":
              convertStrinToBool(widget.inspeccion.cilindroInclinacion!),
          "Cilindro levante laterales":
              convertStrinToBool(widget.inspeccion.cilindroLevanteLateral!),
          "Flexibles hidraulicas":
              convertStrinToBool(widget.inspeccion.flexibleHidraulico!),
          "Fuga por conectores y mangueras":
              convertStrinToBool(widget.inspeccion.fugaConectores!),
        },
        "SISTEMA ELECTRICO": {
          '': [false, false, false],
          "Alternador": convertStrinToBool(widget.inspeccion.alternador!),
          "Bateria": convertStrinToBool(widget.inspeccion.bateria!),
          "Chapa de contacto":
              convertStrinToBool(widget.inspeccion.chapaContacto!),
          "Sistema electrico":
              convertStrinToBool(widget.inspeccion.sistemaElectrico!),
          "Horometro": convertStrinToBool(widget.inspeccion.horometro!),
          "Motor de partida":
              convertStrinToBool(widget.inspeccion.motorPartida!),
          "Palanca comandos":
              convertStrinToBool(widget.inspeccion.palancaComando!),
          "Switch de luces": convertStrinToBool(widget.inspeccion.switchLuces!),
          "Switch de marchas":
              convertStrinToBool(widget.inspeccion.switchMarcha!),
        },
        "CHASIS ESTRUCTURA": {
          '': [false, false, false],
          "Cadenas": convertStrinToBool(widget.inspeccion.cadena!),
          "Carro y su respaldo de carga":
              convertStrinToBool(widget.inspeccion.carro!),
          "Horquillas y seguros":
              convertStrinToBool(widget.inspeccion.horquilla!),
          "Jaula de proteccion": convertStrinToBool(widget.inspeccion.jaula!),
          "LLantas": convertStrinToBool(widget.inspeccion.llantas!),
          "Mastil": convertStrinToBool(widget.inspeccion.mastil!),
          "Pintura": convertStrinToBool(widget.inspeccion.pintura!),
          "Ruedas": convertStrinToBool(widget.inspeccion.rueda!),
        },
        "PRUEBAS DE OPERACION": {
          '': [false, false, false],
          "Desplazador lateral":
              convertStrinToBool(widget.inspeccion.desplazadorLateral!),
          "Direccion": convertStrinToBool(widget.inspeccion.direccion!),
          "Freno mano": convertStrinToBool(widget.inspeccion.frenoMano!),
          "Freno pie": convertStrinToBool(widget.inspeccion.frenoPie!),
          "Inclinacion": convertStrinToBool(widget.inspeccion.inclinacion!),
          "Levante": convertStrinToBool(widget.inspeccion.levante!),
          "Motor": convertStrinToBool(widget.inspeccion.motor!),
          "Nivel aceite hidraulico":
              convertStrinToBool(widget.inspeccion.nivelAceiteHidraulico!),
          "Nivel aceite motor":
              convertStrinToBool(widget.inspeccion.nivelAceiteMotor!),
          "Nivel aceite transmision":
              convertStrinToBool(widget.inspeccion.nivelAceiteTransmision!),
          "Nivel liquido de freno":
              convertStrinToBool(widget.inspeccion.nivelLiquinoFreno!),
          "Tapa combustible":
              convertStrinToBool(widget.inspeccion.tapaCombustible!),
          "Tapa radiador": convertStrinToBool(widget.inspeccion.tapaRadiador!),
          "Transmision": convertStrinToBool(widget.inspeccion.transmision!),
        },
        "FIRMA Y OBSERVACIONES": {}
      };
    } else {
      newFieldsMap = {
        "Carro y su respaldo de carga": [
          "Respaldo de carga: ",
          widget.inspeccion.carga! == 1 ? "Si" : "No"
        ],
        "Serie cargador": ["Serie: ", widget.inspeccion.serieCargardorText!],
        "Bateria": ["Observaciones: ", widget.inspeccion.bateriaObservaciones!],
        "Cargador voltaje y amperaje": [
          "Voltaje: ",
          widget.inspeccion.cargadorVoltajeInfo! + "V"
        ],
        "Enchufes": [
          "Tipo enchufe: ",
          widget.inspeccion.enchufeInfo!.split("-")[0] +
              "V " +
              "POLO " +
              widget.inspeccion.enchufeInfo!.split("-")[1]
        ],
      };

      itemsFromTitle = {
        "ACCESORIOS": {
          '': [false, false, false],
          'Alarma retroceso':
              convertStrinToBool(widget.inspeccion.alarmaRetroceso!),
          'Asiento operdor':
              convertStrinToBool(widget.inspeccion.asientoOperador!),
          'Baliza': convertStrinToBool(widget.inspeccion.baliza!),
          'Bocina': convertStrinToBool(widget.inspeccion.bocina!),
          'Extintor': convertStrinToBool(widget.inspeccion.extintor!),
          'Espejos': convertStrinToBool(widget.inspeccion.espejos!),
          'Focos faeneros delanteros':
              convertStrinToBool(widget.inspeccion.focosFaenerosDelanteros!),
          "Focos faeneros traseros":
              convertStrinToBool(widget.inspeccion.focosFaenerosTraseros!),
          "LLave de contacto":
              convertStrinToBool(widget.inspeccion.llaveContacto!),
          "Intermitentes delanteros":
              convertStrinToBool(widget.inspeccion.intermitentesDelanteros!),
          "Intermitentes traseros":
              convertStrinToBool(widget.inspeccion.intermitentesTraseros!),
          "Palanca freno mano":
              convertStrinToBool(widget.inspeccion.palancaFrenoMano!),
          "Pera de volante": convertStrinToBool(widget.inspeccion.peraVolante!),
          "Tablero instrumentos":
              convertStrinToBool(widget.inspeccion.tableroIntrumentos!),
        },
        "SISTEMA HIDRAULICO": {
          '': [false, false, false],
          "Cilindro desplazador":
              convertStrinToBool(widget.inspeccion.cilindroDesplazador!),
          "Cilindro direccion cadena":
              convertStrinToBool(widget.inspeccion.cilindroDireccion!),
          "Cilindro levante central":
              convertStrinToBool(widget.inspeccion.cilindroLevanteCentral!),
          "Cilindro inclinacion":
              convertStrinToBool(widget.inspeccion.cilindroInclinacion!),
          "Cilindro levante laterales":
              convertStrinToBool(widget.inspeccion.cilindroLevanteLateral!),
          "Flexibles hidraulicas":
              convertStrinToBool(widget.inspeccion.flexibleHidraulico!),
          "Fuga por conectores y mangueras":
              convertStrinToBool(widget.inspeccion.fugaConectores!),
        },
        "SISTEMA ELECTRICO": {
          '': [false, false, false],
          "Bateria": convertStrinToBool(widget.inspeccion.bateria!),
          "Chapa de contacto":
              convertStrinToBool(widget.inspeccion.chapaContacto!),
          "Sistema electrico":
              convertStrinToBool(widget.inspeccion.sistemaElectrico!),
          "Horometro": convertStrinToBool(widget.inspeccion.horometro!),
          "Palanca comandos":
              convertStrinToBool(widget.inspeccion.palancaComando!),
          "Switch de luces": convertStrinToBool(widget.inspeccion.switchLuces!),
          "Switch de marchas":
              convertStrinToBool(widget.inspeccion.switchMarcha!),
          "Joystick": convertStrinToBool(widget.inspeccion.joystick!),
        },
        "CHASIS ESTRUCTURA": {
          '': [false, false, false],
          "Cadenas": convertStrinToBool(widget.inspeccion.cadena!),
          "Carro y su respaldo de carga":
              convertStrinToBool(widget.inspeccion.carro!),
          "Horquillas y seguros":
              convertStrinToBool(widget.inspeccion.horquilla!),
          "Jaula de proteccion": convertStrinToBool(widget.inspeccion.jaula!),
          "LLantas": convertStrinToBool(widget.inspeccion.llantas!),
          "Mastil": convertStrinToBool(widget.inspeccion.mastil!),
          "Pintura": convertStrinToBool(widget.inspeccion.pintura!),
          "Ruedas": convertStrinToBool(widget.inspeccion.rueda!),
        },
        "PRUEBAS DE OPERACION": {
          '': [false, false, false],
          "Desplazador lateral":
              convertStrinToBool(widget.inspeccion.desplazadorLateral!),
          "Direccion": convertStrinToBool(widget.inspeccion.direccion!),
          "Freno mano": convertStrinToBool(widget.inspeccion.frenoMano!),
          "Freno pie": convertStrinToBool(widget.inspeccion.frenoPie!),
          "Inclinacion": convertStrinToBool(widget.inspeccion.inclinacion!),
          "Levante": convertStrinToBool(widget.inspeccion.levante!),
          "Nivel aceite hidraulico":
              convertStrinToBool(widget.inspeccion.nivelAceiteHidraulico!),
          "Serie cargador":
              convertStrinToBool(widget.inspeccion.serieCargador!),
          "Nivel liquido de freno":
              convertStrinToBool(widget.inspeccion.nivelLiquinoFreno!),
          "Cargador voltaje y amperaje":
              convertStrinToBool(widget.inspeccion.cargadorVoltaje!),
          "Enchufes": convertStrinToBool(widget.inspeccion.enchufe!),
        },
        "FIRMA Y OBSERVACIONES": {}
      };
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Map<String, IconData> itemsIcons = {
    "ACCESORIOS": Icons.assignment,
    "SISTEMA HIDRAULICO": Icons.biotech,
    "SISTEMA ELECTRICO": Icons.electrical_services,
    "CHASIS ESTRUCTURA": Icons.directions_car,
    "PRUEBAS DE OPERACION": Icons.speed,
    "FIRMA Y OBSERVACIONES": Icons.edit,
  };

  Map<String, int> itemsPageView = {
    "ACCESORIOS": 0,
    "SISTEMA HIDRAULICO": 1,
    "SISTEMA ELECTRICO": 2,
    "CHASIS ESTRUCTURA": 3,
    "PRUEBAS DE OPERACION": 4,
    "FIRMA Y OBSERVACIONES": 5
  };

  final double fontSizeTextHeader = 18;
  final double fontSizeTextRow = 19;
  String selectPage = "ACCESORIOS";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          body: itemsFromTitle == null
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 35,
                                  color: dark,
                                )),
                            for (var k in itemsFromTitle.keys)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5.0, right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.animateToPage(
                                          itemsPageView[selectPage]!,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.fastOutSlowIn);
                                      selectPage = k;
                                    });
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: selectPage == k
                                              ? Colors.blueAccent
                                              : dark,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: RowNavigator(
                                        iconData: itemsIcons[k]!,
                                        title: k,
                                        fontSizeText: 22,
                                      )),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                          itemCount: itemsFromTitle.length,
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller,
                          itemBuilder: (context, position) {
                            return Column(
                              children: [

                                selectPage == "FIRMA Y OBSERVACIONES"
                                    ? Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: dark,
                                                  width: 1.5,
                                                ),
                                                color: Colors.white),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                    height: 200,
                                                    child: FadeInImage
                                                        .memoryNetwork(
                                                      placeholder:
                                                          kTransparentImage,
                                                      image: widget
                                                          .inspeccion.firmaUrl!,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  RowWidgetObvAndDetails(
                                                    StringFinal:
                                                        widget.inspeccion.rut!,
                                                    StringInitial:
                                                        'Rut Cliente',
                                                  ),
                                                  RowWidgetObvAndDetails(
                                                    StringFinal: widget
                                                        .inspeccion.nombre!,
                                                    StringInitial:
                                                        'Nombre Cliente',
                                                  ),
                                                  RowWidgetObvAndDetails(
                                                    StringFinal: widget
                                                        .inspeccion
                                                        .observacion!,
                                                    StringInitial:
                                                        'Observaciones',
                                                  ),
                                                  RowWidgetObvAndDetails(
                                                    StringFinal: widget
                                                        .inspeccion
                                                        .alturaLevante!,
                                                    StringInitial:
                                                        'Altura de levante',
                                                  ),
                                                  RowWidgetObvAndDetails(
                                                    StringFinal: widget
                                                        .inspeccion
                                                        .horometroActual
                                                        .toString(),
                                                    StringInitial:
                                                        'Horometro registrado',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Flexible(

                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: dark,
                                                  width: 1.5,
                                                ),
                                                color: Colors.white),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  itemsFromTitle[selectPage]
                                                      .length,
                                              itemBuilder: (BuildContext context,
                                                  int index) {
                                                String key =
                                                    itemsFromTitle[selectPage]
                                                        .keys
                                                        .elementAt(index);
                                                return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      border: index==0 ? Border(): Border(top:
                                                      BorderSide(width: 1.5,color: dark),
                                                      )
                                                    ),
                                                    child: SizedBox(
                                                        child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text(
                                                              key,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      fontSizeTextRow),
                                                            ),
                                                          ],
                                                        )),
                                                        Row(
                                                          children: [
                                                            if (newFieldsMap[
                                                                    key] !=
                                                                null)
                                                              Container(
                                                                  child:
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            15.0),
                                                                child: Text(newFieldsMap[
                                                                            key]
                                                                        [0] +
                                                                    newFieldsMap[
                                                                            key]
                                                                        [1]),
                                                              )),
                                                            if (itemSpecial[
                                                                    key] !=
                                                                null)
                                                              Container(
                                                                  child:
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            15.0),
                                                                child: Text(
                                                                    "Cantidad: ${itemSpecial[key]}"),
                                                              )),
                                                            index == 0
                                                                ? Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            10,
                                                                        horizontal:
                                                                            5),
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Bueno",
                                                                            style:
                                                                                TextStyle(fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "Regular",
                                                                            style:
                                                                                TextStyle(fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "Malo",
                                                                            style:
                                                                                TextStyle(fontSize: 18),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                : SizedBox(
                                                                    width: 200,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Checkbox(
                                                                          value:
                                                                              itemsFromTitle[selectPage][key]![0],
                                                                          onChanged:
                                                                              (bool? value) {},
                                                                        ),
                                                                        Checkbox(
                                                                          value:
                                                                              itemsFromTitle[selectPage][key]![1],
                                                                          onChanged:
                                                                              (bool? value) {},
                                                                        ),
                                                                        Checkbox(
                                                                          value:
                                                                              itemsFromTitle[selectPage][key]![2],
                                                                          onChanged:
                                                                              (bool? value) {},
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                          ],
                                                        )
                                                      ],
                                                    )));
                                              },
                                            ),
                                          ),
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
class RowWidgetObvAndDetails extends StatelessWidget {
  const RowWidgetObvAndDetails({
    Key? key,
    required this.StringFinal,
    required this.StringInitial,
  }) : super(key: key);
  final String StringInitial;
  final String StringFinal;
  final double fontSizeRow = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1.5, color: dark))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              StringInitial,
              style: TextStyle(fontSize: fontSizeRow),
            ),
            Text(StringFinal, style: TextStyle(fontSize: fontSizeRow))
          ],
        ),
      ),
    );
  }
}
