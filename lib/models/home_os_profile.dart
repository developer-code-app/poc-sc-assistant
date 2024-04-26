import 'package:copy_with_extension/copy_with_extension.dart';

part 'home_os_profile.g.dart';

@CopyWith()
class HomeOSProfile {
  HomeOSProfile({
    required this.home,
    required this.scenes,
    required this.haveVisitor,
    required this.recentlyUsedSceneId,
  });

  final Home home;
  final List<Scene> scenes;
  final bool haveVisitor;
  final String recentlyUsedSceneId;
}

class Home {
  Home({
    required this.id,
    required this.addressNumber,
  });

  final String id;
  final String addressNumber;
}

class Scene {
  Scene({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  final String id;
  final String name;
  final String iconUrl;
}

// TODO(Nolthicha): remove this when bind API.
class MockData {
  static List<HomeOSProfile> homeOSProfiles = [
    HomeOSProfile(
      home: Home(id: '1', addressNumber: '889/1'),
      haveVisitor: false,
      recentlyUsedSceneId: '2',
      scenes: [
        Scene(
          id: '1',
          name: 'Standby',
          iconUrl: '',
        ),
        Scene(
          id: '2',
          name: 'Active',
          iconUrl: '',
        ),
        Scene(
          id: '3',
          name: 'Turn Off All',
          iconUrl: '',
        ),
      ],
    ),
    HomeOSProfile(
      home: Home(id: '2', addressNumber: '889/2'),
      haveVisitor: false,
      recentlyUsedSceneId: '2',
      scenes: [
        Scene(
          id: '1',
          name: 'Standby',
          iconUrl: '',
        ),
        Scene(
          id: '2',
          name: 'Active',
          iconUrl: '',
        ),
        Scene(
          id: '3',
          name: 'Turn Off All',
          iconUrl: '',
        ),
      ],
    ),
    HomeOSProfile(
      home: Home(id: '3', addressNumber: '889/3'),
      haveVisitor: false,
      recentlyUsedSceneId: '2',
      scenes: [
        Scene(
          id: '1',
          name: 'Standby',
          iconUrl: '',
        ),
        Scene(
          id: '2',
          name: 'Active',
          iconUrl: '',
        ),
        Scene(
          id: '3',
          name: 'Turn Off All',
          iconUrl: '',
        ),
      ],
    ),
    HomeOSProfile(
      home: Home(id: '4', addressNumber: '889/4'),
      haveVisitor: true,
      recentlyUsedSceneId: '2',
      scenes: [
        Scene(
          id: '1',
          name: 'Standby',
          iconUrl: '',
        ),
        Scene(
          id: '2',
          name: 'Active',
          iconUrl: '',
        ),
        Scene(
          id: '3',
          name: 'Turn Off All',
          iconUrl: '',
        ),
      ],
    ),
  ];
}
