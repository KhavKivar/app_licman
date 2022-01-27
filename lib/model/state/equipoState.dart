import 'package:app_licman/services/inventario/equiposServices.dart';
import 'package:flutter/material.dart';

import '../equipo.dart';

class EquipoState extends ChangeNotifier {
  List<Equipo> equipos = [];
  List<Equipo> filterListEquipo = [];
  bool loading = false;

  getEquipo(){
    return equipos;
  }
  setFilter(List<Equipo> newListOfEquipos){
    filterListEquipo = newListOfEquipos;
    notifyListeners();
  }
   initState(context) async{
    loading = true;
    equipos = await getEquipos(context);
    filterListEquipo = [...equipos];

    loading=false;
    notifyListeners();
  }
}