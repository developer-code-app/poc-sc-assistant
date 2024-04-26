// TODO(Nolthicha): remove this when bind API.
import 'package:poc_sc_assistant/models/home.dart';
import 'package:poc_sc_assistant/models/scene.dart';

class MockData {
  static List<Scene> scenes = [
    Scene.standby,
    Scene.active,
    Scene.turnOffAll,
  ];
  static List<Home> homes = [
    Home(
      id: '1',
      addressNumber: '889/1',
      haveVisitor: false,
      recentlyUsedScene: Scene.standby,
    ),
    Home(
      id: '2',
      addressNumber: '889/2',
      haveVisitor: false,
      recentlyUsedScene: Scene.standby,
    ),
    Home(
      id: '3',
      addressNumber: '889/3',
      haveVisitor: false,
      recentlyUsedScene: Scene.standby,
    ),
    Home(
      id: '4',
      addressNumber: '889/4',
      haveVisitor: true,
      recentlyUsedScene: Scene.active,
    ),
  ];
}
