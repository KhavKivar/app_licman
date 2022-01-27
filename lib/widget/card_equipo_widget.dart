import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:app_licman/ui/card_equipo_detalle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardEquipo extends StatelessWidget {
  CardEquipo({Key? key, required this.equipo}) : super(key: key);
  final Equipo equipo;

  Map<String, String> modeloToAssetPath = {
    "ETV 214": "assets/ETV 214.jpg",
    "ERE 224": "assets/" + "ERE 224.jpg",
    "H2.0TX-ET": "assets/" + "Hyster H2.5FT.png",
    "H3.0FT": "assets/" + "H3.0FT.jpg",
    "EFG 220": "assets/" + "EFG 220.jpg",
  };
  final fontSizeText = 20.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset(
                      modeloToAssetPath[equipo.modelo] == null
                      ? "assets/ETV 214.jpg"
                      : modeloToAssetPath[equipo.modelo]!,
                    fit: BoxFit.cover
                  )
              ),
              Expanded(
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color(0xffe0e0e0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Disponible",style: TextStyle(color: Colors.black,fontSize: fontSizeText),)
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Codigo interno",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                                Text("${equipo.id.toString()}",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tipo",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                                Text("${equipo.tipo.toString()}",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Marca",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                                Text("${equipo.marca.toString()}",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Modelo",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                                Text("${equipo.modelo.toString()}",style: TextStyle(color: Colors.black,fontSize: fontSizeText),),
                              ],
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
