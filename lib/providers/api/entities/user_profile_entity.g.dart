// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileEntity _$UserProfileEntityFromJson(Map<String, dynamic> json) =>
    UserProfileEntity(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      project: ProjectEntity.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileEntityToJson(UserProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'project': instance.project,
    };

ProjectEntity _$ProjectEntityFromJson(Map<String, dynamic> json) =>
    ProjectEntity(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProjectEntityToJson(ProjectEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
