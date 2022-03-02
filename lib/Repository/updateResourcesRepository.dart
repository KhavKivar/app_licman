import 'package:app_licman/Repository/EquipoRepository.dart';
import 'package:app_licman/Repository/ImgRepository.dart';
import 'package:app_licman/Repository/InspeccionRepository.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/model/updateTime.dart';
import 'package:provider/provider.dart';

import '../services/hive_services.dart';
import '../services/util.dart';

class UpdateStateRepository {
  final HiveService hiveService = HiveService();
  update(context) async {

    UpdateTime cache_eq = await (hiveService.getBox('cache_time_equipo'));
    UpdateTime cache_img = await (hiveService.getBox('cache_time_img'));
    UpdateTime cache_acta = await (hiveService.getBox('cache_time_acta'));

    List<UpdateTime> realUpdateList = await getLastUpdate();
    if (realUpdateList.length == 3) {

      if (cache_eq.updateTime.toString() !=
          realUpdateList[0].updateTime.toString()) {
        print("UPDATE CACHE EQUIPO");
        print(cache_eq.updateTime.toString()+realUpdateList[0].updateTime.toString() );
        Provider.of<EquipoState>(context, listen: false)
            .setEquipo(await EquipoRepository().get(true));
      }
      //Actualizar cache de actas
      if (cache_acta.updateTime.toString() !=
          realUpdateList[1].updateTime.toString()) {
        print("UPDATE CACHE INSPECCION");
        Provider.of<EquipoState>(context, listen: false)
            .setInspeccion(await InspeccionRepository().get(true));
      }
      //Actualizar el cache de modeloImagen
      print(cache_img.updateTime.toString() +
          realUpdateList[2].updateTime.toString());
      if (cache_img.updateTime.toString() !=
          realUpdateList[2].updateTime.toString()) {
        print("UPDATE CACHE MODELO IMAGEN");
        Provider.of<EquipoState>(context, listen: false)
            .setImgList(await ImgRepository().get(true));
      }
    }
  }
}
