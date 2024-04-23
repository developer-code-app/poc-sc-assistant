import 'package:poc_sc_assistant/pages/home/bloc/home_page_bloc.dart' as model;

class HomePagePresenter {
  HomePagePresenter({required this.homes});

  factory HomePagePresenter.fromModel({
    required List<model.Home> homes,
  }) {
    return HomePagePresenter(
      homes: homes.map((home) => Home.fromModel(home: home)).toList(),
    );
  }

  final List<Home> homes;
}

class Home {
  Home({
    required this.id,
    required this.address,
    required this.currentScene,
    this.isSceneStarted = false,
  });

  factory Home.fromModel({required model.Home home}) {
    return Home(
      id: home.id,
      address: home.address,
      currentScene: home.currentScene,
      isSceneStarted: home.isSceneStarted,
    );
  }

  final String id;
  final String address;
  final String currentScene;
  bool isSceneStarted;
}
