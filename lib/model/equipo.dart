// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Equipo> welcomeFromJson(String str) => List<Equipo>.from(json.decode(str).map((x) => Equipo.fromJson(x)));

String welcomeToJson(List<Equipo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipo {
  Equipo({
    required this.id,
    required this.tipo,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.capacidad,
    required this.mastil,
    required this.altura,
    required this.ano,
    required this.horometro,
    required this.precioNeto,
  });

  int id;
  String tipo;
  String marca;
  String modelo;
  String serie;
  String capacidad = "0";
  String mastil = "";
  String altura = "0";
  int ano;
  int horometro;
  int precioNeto;

  factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
    id: json["id"],
    tipo: json["tipo"],
    marca: json["marca"],
    modelo: json["modelo"],
    serie: json["serie"],
    capacidad: json["capacidad"],
    mastil: json["mastil"],
    altura: json["altura"],
    ano: json["ano"],
    horometro: json["horometro"],
    precioNeto: json["precio_neto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo,
    "marca": marca,
    "modelo": modelo,
    "serie": serie,
    "capacidad": capacidad,
    "mastil": mastil,
    "altura": altura,
    "ano": ano,
    "horometro": horometro,
    "precio_neto": precioNeto,
  };
}
