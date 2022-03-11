import 'links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)

class Launch {

  Links? links;
  String? rocket;
  bool? success;
  String? details;
  String? launchpad;
  String? name;
  DateTime? dateLocal;
  bool? upcoming;
  String? id;
  @JsonKey(ignore: true)
  bool isFav = false;

  Launch(
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


  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}