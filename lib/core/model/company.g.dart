// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Company',
      json,
      ($checkedConvert) {
        final val = Company(
          headquarters: $checkedConvert(
              'headquarters',
              (v) => v == null
                  ? null
                  : Headquarters.fromJson(v as Map<String, dynamic>)),
          name: $checkedConvert('name', (v) => v as String?),
          founder: $checkedConvert('founder', (v) => v as String?),
          founded: $checkedConvert('founded', (v) => v as int?),
          employees: $checkedConvert('employees', (v) => v as int?),
          id: $checkedConvert('id', (v) => v as String?),
          summary: $checkedConvert('summary', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'headquarters': instance.headquarters?.toJson(),
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'summary': instance.summary,
      'id': instance.id,
    };
