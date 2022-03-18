// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patch _$PatchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Patch',
      json,
      ($checkedConvert) {
        final val = Patch(
          $checkedConvert('small', (v) => v as String?),
          $checkedConvert('large', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };
