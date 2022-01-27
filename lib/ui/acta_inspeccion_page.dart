import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/state/actaState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _controller;
  bool _value = false;
  List allValue = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    allValue = Provider.of<ActaState>(context).get_value();

    return SafeArea(
      child: Scaffold(
          body: allValue.isEmpty
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
              : PageView.builder(
                  itemCount: allValue.length,
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Stack(
                                  children: [
                                   if(position == 0) Align(
                                        alignment: Alignment.centerLeft,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            size: 30,
                                          ),
                                        )),
                                    Center(
                                      child: Text(
                                        itemsTitle[position],
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: allValue[position].length,
                            itemBuilder: (BuildContext context, int index) {
                              String key =
                                  allValue[position].keys.elementAt(index);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: index == 0
                                          ? Border()
                                          : Border.all(
                                              color: Colors.black, width: 0.7)),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              if (index > 0) {
                                                showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        'Campos adicionales'),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(key),
                                                        TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Cantidad',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Observaciones',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
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
                                                        if (allValue[position]
                                                                [key]!
                                                            .contains(true)) {
                                                          int index = allValue[
                                                                      position]
                                                                  [key]!
                                                              .indexWhere(
                                                                  (element) =>
                                                                      element ==
                                                                      true);
                                                          allValue[position][
                                                                  key]![index] =
                                                              false;
                                                        }

                                                        //Change all value
                                                        if (index == 0) {
                                                          Provider.of<ActaState>(
                                                                  context,
                                                                  listen: false)
                                                              .changeAllColumn(
                                                                  position,
                                                                  0,
                                                                  value!);
                                                        } else {
                                                          Provider.of<ActaState>(
                                                                  context,
                                                                  listen: false)
                                                              .setValue(
                                                                  position,
                                                                  key,
                                                                  0,
                                                                  value!);
                                                        }
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
                                                        if (allValue[position]
                                                                [key]!
                                                            .contains(true)) {
                                                          int index = allValue[
                                                                      position]
                                                                  [key]!
                                                              .indexWhere(
                                                                  (element) =>
                                                                      element ==
                                                                      true);
                                                          allValue[position][
                                                                  key]![index] =
                                                              false;
                                                        }
                                                        if (index == 0) {
                                                          Provider.of<ActaState>(
                                                                  context,
                                                                  listen: false)
                                                              .changeAllColumn(
                                                                  position,
                                                                  1,
                                                                  value!);
                                                        } else {
                                                          Provider.of<ActaState>(
                                                                  context,
                                                                  listen: false)
                                                              .setValue(
                                                                  position,
                                                                  key,
                                                                  1,
                                                                  value!);
                                                        }
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
                                                        if (allValue[position]
                                                                [key]!
                                                            .contains(true)) {
                                                          int index = allValue[
                                                                      position]
                                                                  [key]!
                                                              .indexWhere(
                                                                  (element) =>
                                                                      element ==
                                                                      true);
                                                          allValue[position][
                                                                  key]![index] =
                                                              false;
                                                        }
                                                        if (index == 0) {
                                                          Provider.of<ActaState>(
                                                                  context,
                                                                  listen: false)
                                                              .changeAllColumn(
                                                                  position,
                                                                  2,
                                                                  value!);
                                                        } else {
                                                          Provider.of<ActaState>(
                                                                  context,
                                                                  listen: false)
                                                              .setValue(
                                                                  position,
                                                                  key,
                                                                  2,
                                                                  value!);
                                                        }
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
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  })),
    );
  }
}
/** 
 * 
 *
 * 
 * */
