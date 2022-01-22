import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _controller;
  bool _value = false;
  late List allValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    allValue = [
      values,
      values_hidraulico,
      values_electrico,
      values_estructura,
      values_operacionales
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Map<String, List<bool>> values = {
    '': [false, false, false],
    'Alarma retroceso': [false, false, false],
    'Asiento operdor': [false, false, false],
    'Baliza': [false, false, false],
    'Bocina': [false, false, false],
    'Extintor': [false, false, false],
    'Espejos': [false, false, false],
    'Focos faeneros delanteros': [false, false, false],
    'Focos faeneros traseros': [false, false, false],
    'LLave de contacto': [false, false, false],
    'Intermitentes delanteros': [false, false, false],
    'Intermitentes traseros': [false, false, false],
    'Palanca freno mano': [false, false, false],
    'Pera de volante': [false, false, false],
    'Tablero instrumentos': [false, false, false],
  };
  Map<String, List<bool>> values_hidraulico = {
    '': [false, false, false],
    'Cilindro desplazador': [false, false, false],
    'Cilindro direccion cadena': [false, false, false],
    'Cilindro levante central': [false, false, false],
    'Cilindro inclinacion': [false, false, false],
    'Cilindro levante laterales': [false, false, false],
    'Flexibles hidraulicas': [false, false, false],
    'Fuga por conectores y mangueras': [false, false, false],
  };

  Map<String, List<bool>> values_electrico = {
    '': [false, false, false],
    'Bateria': [false, false, false],
    'Chapa de contacto': [false, false, false],
    'Sistema electrico': [false, false, false],
    'Horometro': [false, false, false],
    'Palanca comandos': [false, false, false],
    'Switch de luces': [false, false, false],
    'Switch de marchas': [false, false, false],
    'Joystick': [false, false, false],
  };
  Map<String, List<bool>> values_estructura = {
    '': [false, false, false],
    'Cadenas': [false, false, false],
    'Carro y su respaldo de carga': [false, false, false],
    'Horquillas y seguros': [false, false, false],
    'Jaula de proteccion': [false, false, false],
    'LLantas': [false, false, false],
    'Mastil': [false, false, false],
    'Pintura': [false, false, false],
    'Ruedas': [false, false, false],
  };
  Map<String, List<bool>> values_operacionales = {
    '': [false, false, false],
    'Desplazador lateral': [false, false, false],
    'Direccion': [false, false, false],
    'Freno mano': [false, false, false],
    'Inclinacion': [false, false, false],
    'Levante': [false, false, false],
    'Nivel aceite hidraulico': [false, false, false],
    'Serie cargador': [false, false, false],
    'Nivel liquido de freno': [false, false, false],
    'Cargador voltaje y amperaje': [false, false, false],
    'Enchufes': [false, false, false],
  };

  List<String> itemsTitle = [
    "ACCESORIOS",
    "SISTEMA HIDRAULICO",
    "SISTEMA ELECTRICO",
    "CHASIS ESTRUCTURA",
    "PRUEBAS DE OPERACION"
  ];

  final double fontSizeTextHeader = 18;
  final double fontSizeTextRow = 19;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(title: const Text("LICMAN APP")),
        body: PageView.builder(
            itemCount: allValue.length,
            itemBuilder: (context, position) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    itemsTitle[position],
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allValue[position].length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = allValue[position].keys.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            decoration: (index == 0)
                                ? BoxDecoration()
                                : BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if(index >0){


                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Campos adicionales'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(key),
                                                TextField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'Cantidad',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'Observaciones',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                        }
                                      },
                                      child: Row(children: [
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          key,
                                          style: TextStyle(
                                              fontSize: fontSizeTextRow),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 70,
                                        child: Column(
                                          children: [
                                            if (index == 0)
                                              Text(
                                                "Bueno",
                                                style: TextStyle(
                                                    fontSize:
                                                        fontSizeTextHeader),
                                              ),
                                            Checkbox(
                                                value: allValue[position]
                                                    [key]![0],
                                                onChanged: (bool? value) {
                                                  if (allValue[position][key]!
                                                      .contains(true)) {
                                                    int index = allValue[
                                                            position][key]!
                                                        .indexWhere((element) =>
                                                            element == true);
                                                    allValue[position]
                                                        [key]![index] = false;
                                                  }
                                                  setState(() {
                                                    //Change all value
                                                    if (index == 0) {
                                                      for (var i = 0;
                                                          i <
                                                              allValue[position]
                                                                  .length;
                                                          i++) {
                                                        var keyAux =
                                                            allValue[position]
                                                                .keys
                                                                .elementAt(i);
                                                        allValue[position]
                                                            [keyAux] = [
                                                          value!,
                                                          false,
                                                          false
                                                        ];
                                                      }
                                                    } else {
                                                      allValue[position]
                                                          [key]![0] = value!;
                                                    }
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 70,
                                        child: Column(
                                          children: [
                                            if (index == 0)
                                              Text(
                                                "Regular",
                                                style: TextStyle(
                                                    fontSize:
                                                        fontSizeTextHeader),
                                              ),
                                            Checkbox(
                                                value: allValue[position]
                                                    [key]![1],
                                                onChanged: (bool? value) {
                                                  print(values);
                                                  if (allValue[position][key]!
                                                      .contains(true)) {
                                                    int index = allValue[
                                                            position][key]!
                                                        .indexWhere((element) =>
                                                            element == true);
                                                    allValue[position]
                                                        [key]![index] = false;
                                                  }
                                                  setState(() {
                                                    //Change all value
                                                    if (index == 0) {
                                                      for (var i = 0;
                                                          i <
                                                              allValue[position]
                                                                  .length;
                                                          i++) {
                                                        var keyAux =
                                                            allValue[position]
                                                                .keys
                                                                .elementAt(i);
                                                        allValue[position]
                                                            [keyAux] = [
                                                         false,
                                                         value!,
                                                          false
                                                        ];
                                                      }
                                                    } else {
                                                      allValue[position]
                                                          [key]![1] = value!;
                                                    }
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 70,
                                        child: Column(
                                          children: [
                                            if (index == 0)
                                              Text(
                                                "Malo",
                                                style: TextStyle(
                                                    fontSize:
                                                        fontSizeTextHeader),
                                              ),
                                            Checkbox(
                                                value: allValue[position]
                                                    [key]![2],
                                                onChanged: (bool? value) {
                                                  if (allValue[position][key]!
                                                      .contains(true)) {
                                                    int index = allValue[
                                                            position][key]!
                                                        .indexWhere((element) =>
                                                            element == true);
                                                    allValue[position]
                                                        [key]![index] = false;
                                                  }
                                                  setState(() {
                                                    if (index == 0) {
                                                      for (var i = 0;
                                                      i <
                                                          allValue[position]
                                                              .length;
                                                      i++) {
                                                        var keyAux =
                                                        allValue[position]
                                                            .keys
                                                            .elementAt(i);
                                                        allValue[position]
                                                        [keyAux] = [
                                                          false,
                                                          false,
                                                          value!
                                                        ];
                                                      }
                                                    }else {
                                                      allValue[position]
                                                      [key]![2] = value!;
                                                    }
                                                  });
                                                }),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30,)
                ],
              );
            }));
  }
}
/** 
 * 
 *
 * 
 * */
