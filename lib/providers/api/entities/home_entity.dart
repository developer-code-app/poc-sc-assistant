import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_sc_assistant/models/scene.dart';

part 'home_entity.g.dart';

@JsonSerializable(createToJson: false)
class HomeEntity extends Equatable {
  const HomeEntity({
    required this.id,
    required this.addressNumber,
    required this.haveVisitor,
    this.recentlyUsedScene,
  });

  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeEntityFromJson(json);

  final String id;
  final String addressNumber;
  final bool haveVisitor;
  final Scene? recentlyUsedScene;

  @override
  List<Object?> get props => [
        id,
        addressNumber,
        haveVisitor,
        recentlyUsedScene,
      ];
}
