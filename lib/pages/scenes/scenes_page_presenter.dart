import 'package:poc_sc_assistant/gen/assets.gen.dart';

class ScenePagePresenter {
  ScenePagePresenter({required this.homes});

  final List<Home> homes;
}

class Home {
  Home({
    required this.address,
    required this.scenes,
  });

  final String address;
  final List<Scene> scenes;
}

enum Scene {
  standby,
  active,
  turnOffAll;

  SvgGenImage get icon {
    switch (this) {
      case Scene.standby:
        return Assets.icons.standby;
      case Scene.active:
        return Assets.icons.active;
      case Scene.turnOffAll:
        return Assets.icons.turnOffAll;
    }
  }

  String get name {
    switch (this) {
      case Scene.standby:
        return 'Standby';
      case Scene.active:
        return 'Active';
      case Scene.turnOffAll:
        return 'Turn Off All';
    }
  }
}
