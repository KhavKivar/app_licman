import '../model/equipo.dart';
import '../services/hive_services.dart';
import '../services/inventario/equiposServices.dart';

class EquipoRepository {
  final HiveService hiveService = HiveService();

  Future<List<Equipo>> get() async {
    bool exists = await hiveService.isExists(boxName: "Equipos");
    List<Equipo> equipos = [];
    if(exists){
      equipos = await hiveService.getBoxes('Equipos');
    }else{
      equipos = await getEquipos();
      await hiveService.addBoxes(equipos, "Equipos");
    }

    return equipos;
  }
}
