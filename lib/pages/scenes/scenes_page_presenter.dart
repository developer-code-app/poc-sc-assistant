import 'package:poc_sc_assistant/models/home_os_profile.dart' as model;

class ScenesPagePresenter {
  ScenesPagePresenter({required this.homes});

  factory ScenesPagePresenter.fromModel(
    List<model.HomeOSProfile> homeOSProfiles,
  ) {
    return ScenesPagePresenter(
      homes: homeOSProfiles.map(Home.fromModel).toList(),
    );
  }

  final List<Home> homes;
}

class Home {
  Home({
    required this.addressNumber,
    required this.scenes,
  });

  factory Home.fromModel(model.HomeOSProfile profile) {
    return Home(
        addressNumber: profile.home.addressNumber,
        scenes: profile.scenes.map(Scene.fromModel).toList());
  }

  final String addressNumber;
  final List<Scene> scenes;
}

class Scene {
  Scene({
    required this.name,
    required this.iconUrl,
  });

  factory Scene.fromModel(model.Scene scene) {
    return Scene(
      name: scene.name,
      iconUrl: scene.iconUrl,
    );
  }

  final String name;
  final String iconUrl;
}
