import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:poc_sc_assistant/models/scene.dart';
import 'package:poc_sc_assistant/providers/api/entities/home_entity.dart';

part 'home.g.dart';

@CopyWith()
class Home {
  Home({
    required this.id,
    required this.addressNumber,
    required this.haveVisitor,
    this.recentlyUsedScene,
  });

  factory Home.fromEntity(HomeEntity entity) {
    return Home(
      id: entity.id,
      addressNumber: entity.addressNumber,
      haveVisitor: entity.haveVisitor,
      recentlyUsedScene: entity.recentlyUsedScene,
    );
  }

  final String id;
  final String addressNumber;
  final bool haveVisitor;
  final Scene? recentlyUsedScene;
}
