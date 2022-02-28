import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:app_licman/model/modeloimagen.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/ui/card_equipo_detalle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

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
  final fontSizeText = 15.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<ModeloImg> modeloList =
        Provider.of<EquipoState>(context, listen: false).imgList;

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        margin: EdgeInsets.all(3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedNetworkImage(
                      imageUrl: modeloList
                              .any((element) => element.modelo == equipo.modelo)
                          ? modeloList
                              .firstWhere(
                                  (element) => element.modelo == equipo.modelo)
                              .url
                          : "https://www.med.ufro.cl/saludpublica/images/construccion/EnConstruccion_seccion.gif",
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffe0e0e0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15.0,
                              width: 15.0,
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Disponible",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Codigo interno",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            ),
                            Text(
                              "${equipo.id.toString()}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tipo ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontSizeText),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "${equipo.tipo.toString()}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeText),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Marca",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            ),
                            Text(
                              "${equipo.marca.toString()}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Modelo",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            ),
                            Text(
                              "${equipo.modelo.toString()}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: fontSizeText),
                            ),
                          ],
                        ),

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
