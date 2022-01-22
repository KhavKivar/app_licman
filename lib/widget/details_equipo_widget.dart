import 'package:app_licman/model/equipo.dart';
import 'package:flutter/cupertino.dart';

class DetalleEquipoWidget extends StatelessWidget {


  const DetalleEquipoWidget({Key? key,required this.equipoSelect, this.fontSizeTextRow,}) : super(key: key);

  final Equipo equipoSelect;
  final fontSizeTextRow;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tipo",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.tipo,
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Marca",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.marca,
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Modelo",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.modelo,
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Serie",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.serie,
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Altura",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.altura,
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Capacidad",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.capacidad,
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Horometro",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.horometro.toString(),
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Año",
                  style:
                  TextStyle(fontSize: fontSizeTextRow)),
              Text(
                equipoSelect!.ano.toString(),
                style: TextStyle(fontSize: fontSizeTextRow),
              ),
            ],
          )),
    ],);
  }
}
