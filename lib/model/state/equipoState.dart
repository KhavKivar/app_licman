import 'package:app_licman/Repository/EquipoRepository.dart';
import 'package:app_licman/services/inventario/equiposServices.dart';
import 'package:flutter/material.dart';

import '../equipo.dart';
import '../inspeccion.dart';
import '../modeloimagen.dart';

class EquipoState extends ChangeNotifier {
  List<Equipo> equipos = [];
  List<Equipo> filterListEquipo = [];
  List<Inspeccion> inspeccionList = [];

  List<ModeloImg> imgList = [];

  bool loading = false;
  addActa(Inspeccion acta){
    inspeccionList.add(acta);

    notifyListeners();
  }
  getEquipo(){
    return equipos;
  }
  setHorometro(int idEquipo,int hor){
    int  indexEquipo = equipos.lastIndexWhere((element) => element.id==idEquipo);
    equipos[indexEquipo].horometro=hor;
    filterListEquipo = [...equipos];

  }

  setFilter(List<Equipo> newListOfEquipos){
    filterListEquipo = newListOfEquipos;
    notifyListeners();
  }
   initState(context) async{
    loading = true;
    equipos = await EquipoRepository().get();
    filterListEquipo = [...equipos];
    loading=false;
    inspeccionList = await getInspecciones();
    imgList = await getImgList();
    notifyListeners();
  }
}