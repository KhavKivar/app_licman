class Strings {

  //Server
  static const String urlServerReal = "https://vqty0ji4yl.execute-api.us-east-1.amazonaws.com/prod";
  //Dev Server
  static const String localServer = "http://10.0.2.2:3000";

  static const String urlServer = urlServerReal;


  static const String urlServerGetEquipos = urlServer+"/api/equipo";

  static const String urlServerGetInspecciones = urlServer+"/api/inspeccion";
  static const String urlServerGetImg = urlServer+"/api/modelo";


  static const String urlServerPostInps = urlServer+"/api/inspeccion/";
  static const String urlServerGetUrlToUpload = urlServer+"/generatePresignedurl";

}