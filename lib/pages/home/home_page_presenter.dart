import 'package:collection/collection.dart';
import 'package:poc_sc_assistant/models/home_os_profile.dart' as model;

class HomePagePresenter {
  HomePagePresenter({required this.homes});

  factory HomePagePresenter.fromModel({
    required List<model.HomeOSProfile> homeOSProfiles,
  }) {
    return HomePagePresenter(
      homes: homeOSProfiles
          .map((homeOSProfile) => Home.fromModel(homeOSProfile: homeOSProfile))
          .toList(),
    );
  }

  final List<Home> homes;
}

class Home {
  Home({
    required this.id,
    required this.addressNumber,
    required this.haveVisitor,
    this.recentlyUsedScene,
  });

  factory Home.fromModel({required model.HomeOSProfile homeOSProfile}) {
    final recentlyUsedScene = homeOSProfile.scenes.firstWhereOrNull(
      (scene) => scene.id == homeOSProfile.recentlyUsedSceneId,
    );

    return Home(
      id: homeOSProfile.home.id,
      addressNumber: homeOSProfile.home.addressNumber,
      haveVisitor: homeOSProfile.haveVisitor,
      recentlyUsedScene: recentlyUsedScene?.name,
    );
  }

  final String id;
  final String addressNumber;
  final String? recentlyUsedScene;
  final bool haveVisitor;
}
