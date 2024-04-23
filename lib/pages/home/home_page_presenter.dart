class HomePagePresenter {
  HomePagePresenter({required this.homes});

  factory HomePagePresenter.fromModel() {
    return HomePagePresenter(
      homes: [
        Home(address: '889/1', currentScene: 'Standby'),
        Home(address: '889/2', currentScene: 'Standby'),
        Home(address: '889/3', currentScene: 'Standby'),
        Home(address: '889/4', currentScene: 'Active'),
      ],
    );
  }

  final List<Home> homes;
}

class Home {
  Home({
    required this.address,
    required this.currentScene,
    this.isStarted = false,
  });

  final String address;
  final String currentScene;
  final bool isStarted;
}
