import 'package:app_licman/services/inventario/equiposServices.dart';
import 'package:flutter/material.dart';

import '../equipo.dart';

class EquipoState extends ChangeNotifier {
  List<Equipo> equipos = [];
  bool loading = false;

  getEquipo(){
    return equipos;
  }

   initState(context) async{
     loading = true;
    equipos = await getEquipos(context);
    loading=false;
    notifyListeners();
  }
}