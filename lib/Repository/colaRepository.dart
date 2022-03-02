import '../model/cola.dart';
import '../services/hive_services.dart';

class ColaRepository {
  final HiveService hiveService = HiveService();
  get() async {
    var eq = await(hiveService.getBoxes('cola'));
    return List<Cola>.from(eq);
  }
}
