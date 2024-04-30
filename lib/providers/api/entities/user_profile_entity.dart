import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity extends Equatable {
  const UserProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.project,
  });

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileEntityToJson(this);

  final String id;
  final String firstName;
  final String lastName;
  final ProjectEntity project;

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        project,
      ];
}

@JsonSerializable()
class ProjectEntity extends Equatable {
  const ProjectEntity({
    required this.id,
    required this.name,
  });

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectEntityToJson(this);

  final String id;
  final String name;

  @override
  List<Object> get props => [id, name];
}
