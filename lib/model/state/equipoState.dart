import 'package:app_licman/Repository/EquipoRepository.dart';
import 'package:app_licman/Repository/movimientoRepository.dart';
import 'package:app_licman/model/movimiento.dart';
import 'package:app_licman/services/inventario/equiposServices.dart';
import 'package:flutter/material.dart';

import '../../Repository/ImgRepository.dart';
import '../../Repository/InspeccionRepository.dart';
import '../../Repository/colaRepository.dart';
import '../../Repository/updateResourcesRepository.dart';
import '../cola.dart';
import '../equipo.dart';
import '../inspeccion.dart';
import '../modeloimagen.dart';

class EquipoState extends ChangeNotifier {
  List<Equipo> equipos = [];
  List<Equipo> filterListEquipo = [];
  List<Inspeccion> inspeccionList = [];
  List<ModeloImg> imgList = [];
  List<Cola> listCola = [];
  List<Movimiento> movimientos = [];

  int indexCola = -1;
  setIndexCola(int index){
    indexCola = index;
  }

  bool loading = false;
  addActa(Inspeccion acta){
    inspeccionList.add(acta);
    notifyListeners();
  }
  setActa(Inspeccion acta){
    int index = inspeccionList.indexWhere((element) => element.idInspeccion == acta.idInspeccion);
    if(index != -1){
      inspeccionList[index] = acta;
    }
    notifyListeners();
  }

  removeCola(Cola cola){
    int indexCola = listCola.indexWhere((element) => element.acta?.idInspeccion == cola.acta?.idInspeccion);
    if(indexCola >=0){
      listCola.removeAt(indexCola);
    }
    notifyListeners();
  }

  addCola(Cola cola){
    listCola.add(cola);
    notifyListeners();
  }
  getEquipo(){
    return equipos;
  }
  setHorometro(int idEquipo,int hor){
    int  indexEquipo = equipos.lastIndexWhere((element) => element.id==idEquipo);
    if(equipos[indexEquipo].horometro < hor){

      equipos[indexEquipo].horometro = hor;
    }
    filterListEquipo = [...equipos];
    notifyListeners();

  }
  setEquipo(List<Equipo> newListOfEquipos){
    equipos = newListOfEquipos;
    filterListEquipo = [...equipos];
    notifyListeners();
  }
  setInspeccion( List<Inspeccion> newList){
    inspeccionList=newList;
    notifyListeners();
  }
  setImgList( List<ModeloImg> newList){
    imgList=newList;
    notifyListeners();
  }

  setFilter(List<Equipo> newListOfEquipos){
    filterListEquipo = newListOfEquipos;
    notifyListeners();
  }
   initState(context) async{
    loading = true;
    equipos = await EquipoRepository().get(false);

    filterListEquipo = [...equipos];
    loading=false;
    inspeccionList = await InspeccionRepository().get(false);
    imgList = await ImgRepository().get(false);
    listCola = await ColaRepository().get();
    movimientos = await MovimientoRepository().get(false);
    notifyListeners();
    return loading;
  }

  void setMovimientoList(List<Movimiento> list) {
    movimientos = list;
    notifyListeners();
  }
}