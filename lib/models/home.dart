import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:poc_sc_assistant/models/scene.dart';

part 'home.g.dart';

@CopyWith()
class Home {
  Home({
    required this.id,
    required this.addressNumber,
    required this.haveVisitor,
    this.recentlyUsedScene,
  });

  final String id;
  final String addressNumber;
  final bool haveVisitor;
  final Scene? recentlyUsedScene;
}
