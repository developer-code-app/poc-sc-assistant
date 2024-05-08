// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) => HomeEntity(
      id: json['id'] as String,
      addressNumber: json['address_number'] as String,
      haveVisitor: json['have_visitor'] as bool,
      recentlyUsedScene:
          $enumDecodeNullable(_$SceneEnumMap, json['recently_used_scene']),
    );

const _$SceneEnumMap = {
  Scene.standby: 'STANDBY',
  Scene.active: 'ACTIVE',
  Scene.turnOffAll: 'TURN_OFF_ALL',
  Scene.unknown: 'UNKNOWN',
};
