import 'package:poc_sc_assistant/providers/api/entities/user_profile_entity.dart';

class UserProfile {
  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.project,
  });

  factory UserProfile.fromEntity(UserProfileEntity entity) {
    return UserProfile(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      project: Project.fromEntity(entity.project),
    );
  }

  final String id;
  final String firstName;
  final String lastName;
  final Project project;
}

class Project {
  Project({
    required this.id,
    required this.name,
  });

  factory Project.fromEntity(ProjectEntity entity) {
    return Project(id: entity.id, name: entity.name);
  }

  final String id;
  final String name;
}
