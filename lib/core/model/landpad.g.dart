// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landpad _$LandpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Landpad',
      json,
      ($checkedConvert) {
        final val = Landpad(
          full_name: $checkedConvert('full_name', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String?),
          locality: $checkedConvert('locality', (v) => v as String?),
          region: $checkedConvert('region', (v) => v as String?),
          longitude:
              $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
          latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
          landing_successes:
              $checkedConvert('landing_successes', (v) => v as String?),
          landing_attempts:
              $checkedConvert('landing_attempts', (v) => v as String?),
          details: $checkedConvert('details', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LandpadToJson(Landpad instance) => <String, dynamic>{
      'full_name': instance.full_name,
      'status': instance.status,
      'locality': instance.locality,
      'region': instance.region,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'landing_attempts': instance.landing_attempts,
      'landing_successes': instance.landing_successes,
      'details': instance.details,
      'id': instance.id,
    };
