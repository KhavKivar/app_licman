import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'updateTime.g.dart';
List<UpdateTime> updateTimeFromJson(String str) => List<UpdateTime>.from(json.decode(str).map((x) => UpdateTime.fromJson(x)));

String updateTimeToJson(List<UpdateTime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@HiveType(typeId: 3)
class UpdateTime extends HiveObject{
  UpdateTime({
    required this.updateTime
  });
  @HiveField(0)
  String updateTime;

  factory UpdateTime.fromJson(Map<String, dynamic> json) => UpdateTime(
    updateTime: json["UPDATE_TIME"],
  );

  Map<String, dynamic> toJson() => {
    "UPDATE_TIME": updateTime
  };
}
