// To parse this JSON data, do
//
//     final inspeccion = inspeccionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Inspeccion> inspeccionFromJson(String str) => List<Inspeccion>.from(json.decode(str).map((x) => Inspeccion.fromJson(x)));

String inspeccionToJson(List<Inspeccion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inspeccion {
  Inspeccion({
     this.idInspeccion,
     this.alarmaRetroceso,
     this.asientoOperador,
     this.baliza,
     this.idEquipo,
     this.bocina,
     this.extintor,
     this.espejos,
     this.cantidadEspejos,
     this.focosFaenerosDelanteros,
     this.cantidadFocosFaenerosDelanteros,
     this.focosFaenerosTraseros,
     this.cantidadFocosFaenerosTraseros,
     this.llaveContacto,
     this.cantidadLlaveContacto,
     this.intermitentesDelanteros,
     this.cantidadIntermitentesDelanteros,
     this.intermitentesTraseros,
     this.cantidadIntermitentesTraseros,
     this.palancaFrenoMano,
     this.peraVolante,
     this.arnesCilindroGas,
     this.tableroIntrumentos,
     this.cilindroDesplazador,
     this.cilindroDireccion,
     this.cilindroLevanteCentral,
     this.cilindroInclinacion,
     this.cilindroLevanteLateral,
     this.flexibleHidraulico,
     this.fugaConectores,
     this.alternador,
     this.bateria,
     this.chapaContacto,
     this.sistemaElectrico,
     this.horometro,
     this.motorPartida,
     this.palancaComando,
     this.switchLuces,
     this.switchMarcha,
     this.cadena,
     this.carro,
     this.horquilla,
     this.jaula,
     this.llantas,
     this.mastil,
     this.pintura,
     this.rueda,
     this.cantidadRueda,
     this.desplazadorLateral,
     this.direccion,
     this.frenoMano,
     this.frenoPie,
     this.inclinacion,
     this.levante,
     this.motor,
     this.nivelAceiteHidraulico,
    this.nivelAceiteMotor,
     this.nivelAceiteTransmision,
     this.nivelLiquinoFreno,
     this.tapaCombustible,
     this.tapaRadiador,
     this.transmision,
    this.observacion,
     this.firmaUrl,
     this.rut,
     this.nombre,
    this.joystick,
    this.cargadorVoltaje,
    this.enchufe,
    this.serieCargador,
    this.tipo,
   this.alturaLevante,
   this.carga,
   this.bateriaObservaciones,
   this.serieCargardorText,
   this.cargadorVoltajeInfo,
   this.enchufeInfo,
this.cilindroDeGas,
    this.horometroActual,

    this.ts,

  });

  int? idInspeccion;
  String? alarmaRetroceso;
  String? asientoOperador;
  String? baliza;
  int? idEquipo;
  String? bocina;
  String? extintor;
  String? espejos;
  int? cantidadEspejos;
  String? focosFaenerosDelanteros;
  int? cantidadFocosFaenerosDelanteros;
  String? focosFaenerosTraseros;
  int? cantidadFocosFaenerosTraseros;
  String? llaveContacto;
  int? cantidadLlaveContacto;
  String? intermitentesDelanteros;
  int? cantidadIntermitentesDelanteros;
  String? intermitentesTraseros;
  int? cantidadIntermitentesTraseros;
  String? palancaFrenoMano;
  String? peraVolante;
  String? arnesCilindroGas;
  String? tableroIntrumentos;
  String? cilindroDesplazador;
  String? cilindroDireccion;
  String? cilindroLevanteCentral;
  String? cilindroInclinacion;
  String? cilindroLevanteLateral;
  String? flexibleHidraulico;
  String? fugaConectores;
  String? alternador;
  String? bateria;
  String? chapaContacto;
  String? sistemaElectrico;
  String? horometro;
  String? motorPartida;
  String? palancaComando;
  String? switchLuces;
  String? switchMarcha;
  String? cadena;
  String? carro;
  String? horquilla;
  String? jaula;
  String? llantas;
  String? mastil;
  String? pintura;
  String? rueda;
  int? cantidadRueda;
  String? desplazadorLateral;
  String? direccion;
  String? frenoMano;
  String? frenoPie;
  String? inclinacion;
  String? levante;
  String? motor;
  String? nivelAceiteHidraulico;
  String? nivelAceiteMotor;
  String ?nivelAceiteTransmision;
  String? nivelLiquinoFreno;
  String? tapaCombustible;
  String? tapaRadiador;
  String? transmision;
  String? observacion;
  String? firmaUrl;
  String? rut;
  String? nombre;

  String? joystick;
  String? serieCargador;
  String? cargadorVoltaje;
  String? enchufe;
  String? tipo;
  String? alturaLevante;
  int? carga;
  int? cilindroDeGas;

  String? bateriaObservaciones;
  String? serieCargardorText;
  String? cargadorVoltajeInfo;
  String? enchufeInfo;

  int? horometroActual;


  DateTime? ts;

  factory Inspeccion.fromJson(Map<String, dynamic> json) => Inspeccion(
    idInspeccion: json["idInspeccion"],
    alarmaRetroceso: json["alarmaRetroceso"],
    asientoOperador: json["asientoOperador"],
    baliza: json["baliza"],
    idEquipo: json["idEquipo"],
    bocina: json["bocina"],
    extintor: json["extintor"],
    espejos: json["espejos"],
    cantidadEspejos: json["cantidadEspejos"],
    focosFaenerosDelanteros: json["focosFaenerosDelanteros"],
    cantidadFocosFaenerosDelanteros: json["cantidadFocosFaenerosDelanteros"],
    focosFaenerosTraseros: json["focosFaenerosTraseros"],
    cantidadFocosFaenerosTraseros: json["cantidadFocosFaenerosTraseros"],
    llaveContacto: json["llaveContacto"],
    cantidadLlaveContacto: json["cantidadLlaveContacto"],
    intermitentesDelanteros: json["intermitentesDelanteros"],
    cantidadIntermitentesDelanteros: json["cantidadIntermitentesDelanteros"],
    intermitentesTraseros: json["intermitentesTraseros"],
    cantidadIntermitentesTraseros: json["cantidadIntermitentesTraseros"],
    palancaFrenoMano: json["palancaFrenoMano"],
    peraVolante: json["peraVolante"],
    arnesCilindroGas: json["arnesCilindroGas"],
    tableroIntrumentos: json["tableroIntrumentos"],
    cilindroDesplazador: json["cilindroDesplazador"],
    cilindroDireccion: json["cilindroDireccion"],
    cilindroLevanteCentral: json["cilindroLevanteCentral"],
    cilindroInclinacion: json["cilindroInclinacion"],
    cilindroLevanteLateral: json["cilindroLevanteLateral"],
    flexibleHidraulico: json["flexibleHidraulico"],
    fugaConectores: json["fugaConectores"],
    alternador: json["alternador"],
    bateria: json["bateria"],
    chapaContacto: json["chapaContacto"],
    sistemaElectrico: json["sistemaElectrico"],
    horometro: json["horometro"],
    motorPartida: json["motorPartida"],
    palancaComando: json["palancaComando"],
    switchLuces: json["switchLuces"],
    switchMarcha: json["switchMarcha"],
    cadena: json["cadena"],
    carro: json["carro"],
    horquilla: json["horquilla"],
    jaula: json["jaula"],
    llantas: json["llantas"],
    mastil: json["mastil"],
    pintura: json["pintura"],
    rueda: json["rueda"],
    cantidadRueda: json["cantidadRueda"],
    desplazadorLateral: json["desplazadorLateral"],
    direccion: json["direccion"],
    frenoMano: json["frenoMano"],
    frenoPie: json["frenoPie"],
    inclinacion: json["inclinacion"],
    levante: json["levante"],
    motor: json["motor"],
    nivelAceiteHidraulico: json["nivelAceiteHidraulico"],
    nivelAceiteMotor:json["nivelAceiteMotor"],
    nivelAceiteTransmision: json["nivelAceiteTransmision"],
    nivelLiquinoFreno: json["nivelLiquinoFreno"],
    tapaCombustible: json["tapaCombustible"],
    tapaRadiador: json["tapaRadiador"],
    transmision: json["transmision"],
    observacion: json["observacion"],
    firmaUrl: json["firmaURL"],
    rut: json["rut"],
    nombre: json["nombre"],
    tipo: json["tipo"],
    joystick: json["joystick"],
    serieCargador:json["serieCargador"] ,
    cargadorVoltaje: json["cargadorVoltaje"],
    enchufe: json["enchufe"],
    alturaLevante: json["alturaLevante"],
    carga: json["carga"],
    cilindroDeGas :json["cilindroDeGas"],
    bateriaObservaciones: json["bateriaObservaciones"],
    serieCargardorText: json["serieCargardorText"],
 cargadorVoltajeInfo: json["cargadorVoltajeInfo"],
  enchufeInfo: json["enchufeInfo"],
    horometroActual: json["horometroActual"],


    ts: DateTime.parse(json["ts"]),
  );

  Map<String, dynamic> toJson() => {

    "tipo": tipo,
    "alarmaRetroceso": alarmaRetroceso,
    "asientoOperador": asientoOperador,
    "baliza": baliza,
    "idEquipo": idEquipo,
    "bocina": bocina,
    "extintor": extintor,
    "espejos": espejos,
    "cantidadEspejos": cantidadEspejos,
    "focosFaenerosDelanteros": focosFaenerosDelanteros,
    "cantidadFocosFaenerosDelanteros": cantidadFocosFaenerosDelanteros,
    "focosFaenerosTraseros": focosFaenerosTraseros,
    "cantidadFocosFaenerosTraseros": cantidadFocosFaenerosTraseros,
    "llaveContacto": llaveContacto,
    "cantidadLlaveContacto": cantidadLlaveContacto,
    "intermitentesDelanteros": intermitentesDelanteros,
    "cantidadIntermitentesDelanteros": cantidadIntermitentesDelanteros,
    "intermitentesTraseros": intermitentesTraseros,
    "cantidadIntermitentesTraseros": cantidadIntermitentesTraseros,
    "palancaFrenoMano": palancaFrenoMano,
    "peraVolante": peraVolante,
    "arnesCilindroGas": arnesCilindroGas == null ? null : arnesCilindroGas,
    "tableroIntrumentos": tableroIntrumentos,
    "cilindroDesplazador": cilindroDesplazador,
    "cilindroDireccion": cilindroDireccion,
    "cilindroLevanteCentral": cilindroLevanteCentral,
    "cilindroInclinacion": cilindroInclinacion,
    "cilindroLevanteLateral": cilindroLevanteLateral,
    "flexibleHidraulico": flexibleHidraulico,
    "fugaConectores": fugaConectores,
    "alternador": alternador == null ? null : alternador,
    "bateria": bateria,
    "chapaContacto": chapaContacto,
    "sistemaElectrico": sistemaElectrico,
    "horometro": horometro,
    "motorPartida": motorPartida == null ? null : motorPartida,
    "palancaComando": palancaComando,
    "switchLuces": switchLuces,
    "switchMarcha": switchMarcha,
    "joystick": joystick == null ? null : joystick,
    "cadena": cadena,
    "carro": carro,
    "horquilla": horquilla,
    "jaula": jaula,
    "llantas": llantas,
    "mastil": mastil,
    "pintura": pintura,
    "rueda": rueda,
    "cantidadRueda": cantidadRueda.toString(),
    "desplazadorLateral": desplazadorLateral,
    "direccion": direccion,
    "frenoMano": frenoMano,
    "frenoPie": frenoPie,
    "inclinacion": inclinacion,
    "levante": levante,
    "motor": motor == null ? null : motor,
    "serieCargador": serieCargador == null ? null : serieCargador,
    "nivelAceiteHidraulico": nivelAceiteHidraulico,
    "nivelAceiteMotor": nivelAceiteMotor == null ? null : nivelAceiteMotor,
    "nivelAceiteTransmision": nivelAceiteTransmision == null ? null : nivelAceiteTransmision,
    "nivelLiquinoFreno": nivelLiquinoFreno,
    "tapaCombustible": tapaCombustible == null ? null : tapaCombustible,
    "tapaRadiador": tapaRadiador == null ? null : tapaRadiador,
    "transmision": transmision == null ? null : transmision,
    "cargadorVoltaje": cargadorVoltaje == null ? null : cargadorVoltaje,
    "enchufe": enchufe == null ? null : enchufe,
    "observacion": observacion,
    "alturaLevante": alturaLevante,
    "carga": carga,
    "cilindroDeGas": cilindroDeGas == null ? null : cilindroDeGas,
    "bateriaObservaciones": bateriaObservaciones == null ? null : bateriaObservaciones,
    "serieCargardorText": serieCargardorText == null ? null : serieCargardorText,
    "cargadorVoltajeInfo": cargadorVoltajeInfo == null ? null : cargadorVoltajeInfo,
    "enchufeInfo": enchufeInfo == null ? null : enchufeInfo,
    "horometroActual": horometroActual,
    "firmaURL": firmaUrl,
    "rut": rut,
    "nombre": nombre,

  };

}
