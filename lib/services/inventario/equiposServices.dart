
import 'dart:convert';

import 'package:app_licman/const/Strings.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<Equipo>> getEquipos(context) async {
  List<Equipo> listado = [];
  final client = http.Client();
  final response = await client.get(Uri.parse(Strings.urlServerGetEquipos));
  print(response.body);
  if (response.statusCode == 200) {
    listado = (json.decode(response.body) as List)
        .map((i) => Equipo.fromJson(i))
        .toList();
  }else {

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Data no cargo'),
          duration: const Duration(seconds: 1),
        )
    );


  }

  return listado;
}

