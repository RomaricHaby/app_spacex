// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
          rocket: $checkedConvert('rocket', (v) => v as String?),
          success: $checkedConvert('success', (v) => v as bool?),
          details: $checkedConvert('details', (v) => v as String?),
          launchpad: $checkedConvert('launchpad', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          dateLocal: $checkedConvert('date_local',
              (v) => v == null ? null : DateTime.parse(v as String)),
          upcoming: $checkedConvert('upcoming', (v) => v as bool?),
          id: $checkedConvert('id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'dateLocal': 'date_local'},
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'rocket': instance.rocket,
      'success': instance.success,
      'details': instance.details,
      'launchpad': instance.launchpad,
      'name': instance.name,
      'date_local': instance.dateLocal?.toIso8601String(),
      'upcoming': instance.upcoming,
      'id': instance.id,
    };
