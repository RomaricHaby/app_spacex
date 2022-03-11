import 'package:app_spacex/core/model/headquarters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'headquarters.dart';


part 'company.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)

class Company{

  Headquarters? headquarters;
  String? name;
  String? founder;
  int? founded;
  int? employees;
  String? summary;
  String? id;

  Company(
      {
        this.headquarters,
        this.name,
        this.founder,
      this.founded,
      this.employees,
      this.id,
      this.summary});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}