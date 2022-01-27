import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardEquipoDetalle extends StatefulWidget {
  const cardEquipoDetalle({Key? key, required this.equipo}) : super(key: key);
  final Equipo equipo;

  @override
  _cardEquipoDetalleState createState() => _cardEquipoDetalleState();
}

class _cardEquipoDetalleState extends State<cardEquipoDetalle> {
  var choose = 0;
  final fontSizeHead = 20.0;
  final fontSizeContent = 25.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Hero(
              tag: widget.equipo.id,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {

                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: dark,
                      size: 40,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        choose = 0;
                                      });
                                    },
                                    child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.article,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Especificaciones",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: fontSizeHead),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: choose == 0
                                                ? Colors.blueAccent
                                                : dark,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30)))),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        choose = 1;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 0),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.assignment,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Actas generales",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: fontSizeHead),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: choose == 1
                                              ? Colors.blueAccent
                                              : dark,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        choose = 2;
                                      });
                                    },
                                    child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.swap_vert,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Movimientos",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: fontSizeHead)),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: choose == 2
                                                ? Colors.blueAccent
                                                : dark,
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(30)))),
                                  ),
                                ),
                              ],
                            ),
                            if (choose == 0)
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Codigo interno ',
                                                  style: TextStyle(
                                                      fontSize:
                                                          fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.id.toString(),
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Tipo',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent
                                                    ),
                                                ),
                                                Text(
                                                  widget.equipo.tipo,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Modelo',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.modelo,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Marca',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.marca,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Serie',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.serie,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width:1, color: dark),
                                          ),
                                          child: Padding(
                                            padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Altura',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.altura,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width:1, color: dark),
                                          ),
                                          child: Padding(
                                            padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Capacidad',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.capacidad,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Mastil',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.mastil,
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: dark),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Horometro',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.horometro
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: dark),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Año',
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent),
                                                ),
                                                Text(
                                                  widget.equipo.ano.toString(),
                                                  style: TextStyle(
                                                      fontSize: fontSizeContent,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            else if (choose == 1)
                              Text("1")
                            else
                              Text("2")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
