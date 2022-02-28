
import 'dart:convert';

List<ModeloImg> modeloImgFromJson(String str) => List<ModeloImg>.from(json.decode(str).map((x) => ModeloImg.fromJson(x)));

String modeloImgToJson(List<ModeloImg> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModeloImg {
  ModeloImg({
    required this.modelo,
    required this.url,
  });

  String modelo;
  String url;

  factory ModeloImg.fromJson(Map<String, dynamic> json) => ModeloImg(
    modelo: json["modelo"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "modelo": modelo,
    "url": url,
  };
}
