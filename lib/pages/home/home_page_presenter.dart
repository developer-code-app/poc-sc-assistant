import 'package:poc_sc_assistant/models/home.dart' as model;

class HomePagePresenter {
  HomePagePresenter({
    required this.projectName,
    required this.homes,
  });

  factory HomePagePresenter.fromModel({
    required String projectName,
    required List<model.Home> homes,
  }) {
    return HomePagePresenter(
      projectName: projectName,
      homes: homes.map(Home.fromModel).toList(),
    );
  }

  final String projectName;
  final List<Home> homes;
}

class Home {
  Home({
    required this.id,
    required this.addressNumber,
    required this.haveVisitor,
    this.recentlyUsedScene,
  });

  factory Home.fromModel(model.Home home) {
    return Home(
      id: home.id,
      addressNumber: home.addressNumber,
      haveVisitor: home.haveVisitor,
      recentlyUsedScene: home.recentlyUsedScene?.name,
    );
  }

  final String id;
  final String addressNumber;
  final String? recentlyUsedScene;
  final bool haveVisitor;
}
