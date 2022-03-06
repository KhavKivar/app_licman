class Strings {

  //Server
  static const String urlServerReal = "http://54.242.41.108";
  //Dev Server
  static const String localServer = "http://10.0.2.2:3000";
  //Desktop Sv
  static const String desktopLocalSv = "http://localhost:3000";

  static const String urlServer = desktopLocalSv;


  static const String urlServerGetEquipos = urlServer+"/api/equipo";

  static const String urlServerGetInspecciones = urlServer+"/api/inspeccion";
  static const String urlServerGetImg = urlServer+"/api/modelo";

  static const String urlServerPostInps = urlServer+"/api/inspeccion/";
  static const String urlServerGetUrlToUpload = urlServer+"/generatePresignedurl";
  static const String urlServerGetUpdateState= urlServer+"/api/getLastUpdate/";
  static const String urlServerEditInps = urlServer+"/api/inspeccion/id/";
  static const String urlServerGetMovimientos = urlServer+"/api/movimiento/";

}