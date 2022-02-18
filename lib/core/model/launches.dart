import 'links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launches.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)

class Launches {

  Links? links;
  String? rocket;
  bool? success;
  String? details;
  String? launchpad;
  String? name;
  String? dateLocal;
  bool? upcoming;
  String? id;

  Launches(
      {
        this.links,
        this.rocket,
        this.success,
        this.details,
        this.launchpad,
        this.name,
        this.dateLocal,
        this.upcoming,
        this.id});


  factory Launches.fromJson(Map<String, dynamic> json) => _$LaunchesFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchesToJson(this);
}