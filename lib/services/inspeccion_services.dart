import 'dart:convert';
import 'dart:developer';

import 'package:app_licman/const/Strings.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:app_licman/model/inspeccion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Inspeccion?> sendActa(Inspeccion acta) async {
  final url = Uri.parse(Strings.urlServerPostInps);

  try {
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(acta.toJson()));
    log(response.body);
    return Inspeccion.fromJson(json.decode(response.body));
  } catch (e) {
    return null;
  }
}
