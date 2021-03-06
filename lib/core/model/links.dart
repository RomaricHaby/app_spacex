import 'package:app_spacex/core/model/patch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(checked: true, fieldRename: FieldRename.snake, explicitToJson: true)
class Links{

  Patch? patch;

  Links(
      this.patch
      );

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}