import 'package:app_licman/services/inventario/equiposServices.dart';
import 'package:flutter/material.dart';

import '../equipo.dart';

class ActaState extends ChangeNotifier {
  final acta_state = [
    {
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
    },
    {
      '': [false, false, false],
      'Cilindro desplazador': [false, false, false],
      'Cilindro direccion cadena': [false, false, false],
      'Cilindro levante central': [false, false, false],
      'Cilindro inclinacion': [false, false, false],
      'Cilindro levante laterales': [false, false, false],
      'Flexibles hidraulicas': [false, false, false],
      'Fuga por conectores y mangueras': [false, false, false],
    },
    {
      '': [false, false, false],
      'Bateria': [false, false, false],
      'Chapa de contacto': [false, false, false],
      'Sistema electrico': [false, false, false],
      'Horometro': [false, false, false],
      'Palanca comandos': [false, false, false],
      'Switch de luces': [false, false, false],
      'Switch de marchas': [false, false, false],
      'Joystick': [false, false, false],
    },
    {
      '': [false, false, false],
      'Cadenas': [false, false, false],
      'Carro y su respaldo de carga': [false, false, false],
      'Horquillas y seguros': [false, false, false],
      'Jaula de proteccion': [false, false, false],
      'LLantas': [false, false, false],
      'Mastil': [false, false, false],
      'Pintura': [false, false, false],
      'Ruedas': [false, false, false],
    },
    {
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
    }
  ];
  setValue(int position, String key,int boolPosition,bool value){
    acta_state[position][key]![boolPosition]  = value;
    notifyListeners();
  }
  changeAllColumn(int position, int columnInt,bool value) {
    for (var i = 0; i < acta_state[position].length; i++) {
      var keyAux = acta_state[position].keys.elementAt(i);
      if (columnInt == 0) {
        print("hey");
        print(value);
        acta_state[position][keyAux] = [value, false, false];
      }
      if (columnInt == 1) {
        acta_state[position][keyAux] = [ false, value, false];
      } if(columnInt ==2) {
        acta_state[position][keyAux] = [false, false, value];
      }
    }
    notifyListeners();
  }
  get_value(){
    return acta_state;
  }
}
