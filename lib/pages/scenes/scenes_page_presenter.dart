import 'package:poc_sc_assistant/gen/assets.gen.dart';
import 'package:poc_sc_assistant/models/home.dart' as home_model;
import 'package:poc_sc_assistant/models/mock_data.dart';
import 'package:poc_sc_assistant/models/scene.dart' as scene_model;

class ScenesPagePresenter {
  ScenesPagePresenter({required this.homes});

  factory ScenesPagePresenter.fromModel(List<home_model.Home> homes) {
    return ScenesPagePresenter(homes: homes.map(Home.fromModel).toList());
  }

  final List<Home> homes;
}

class Home {
  Home({
    required this.addressNumber,
    required this.scenes,
  });

  factory Home.fromModel(home_model.Home home) {
    return Home(
      addressNumber: home.addressNumber,
      scenes: MockData.scenes.map(Scene.fromModel).toList(),
    );
  }

  final String addressNumber;
  final List<Scene> scenes;
}

class Scene {
  Scene({
    required this.name,
    required this.icon,
  });

  factory Scene.fromModel(scene_model.Scene scene) {
    return Scene(
      name: scene.name,
      icon: scene.icon,
    );
  }

  final String name;
  final AssetGenImage icon;
}
