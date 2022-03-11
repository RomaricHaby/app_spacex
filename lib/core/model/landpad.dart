

import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'landpad.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)

class Landpad{

  String? full_name;
  String? status;
  String? locality;
  String? region;
  double? longitude;
  double? latitude;
  String? landing_attempts;
  String? landing_successes;
  String? details;
  String? id;

  Landpad(
      {
        this.full_name,
        this.status,
        this.locality,
        this.region,
        this.longitude,
        this.latitude,
        this.landing_successes,
        this.landing_attempts,
        this.details,
        this.id
      });

  factory Landpad.fromJson(Map<String, dynamic> json) => _$LandpadFromJson(json);
  Map<String, dynamic> toJson() => _$LandpadToJson(this);
}