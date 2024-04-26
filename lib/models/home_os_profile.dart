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
  static List<Scene> scenes = [
    Scene(
      id: '1',
      name: 'Standby',
      iconUrl:
          'https://firebasestorage.googleapis.com/v0/b/playground-46062.appspot.com/o/standby.png?alt=media&token=6691f1e8-a4c2-4dcb-b485-f028b29e1a1f',
    ),
    Scene(
      id: '2',
      name: 'Active',
      iconUrl:
          'https://firebasestorage.googleapis.com/v0/b/playground-46062.appspot.com/o/active.png?alt=media&token=6ae80e21-1292-4a27-a687-9d6100fdcdce',
    ),
    Scene(
      id: '3',
      name: 'Turn Off All',
      iconUrl:
          'https://firebasestorage.googleapis.com/v0/b/playground-46062.appspot.com/o/turn_off_all.png?alt=media&token=6b69d833-3b24-48f1-880e-91cee51dd722',
    ),
  ];
  static List<HomeOSProfile> homeOSProfiles = [
    HomeOSProfile(
      home: Home(id: '1', addressNumber: '889/1'),
      haveVisitor: false,
      recentlyUsedSceneId: '1',
      scenes: scenes,
    ),
    HomeOSProfile(
      home: Home(id: '2', addressNumber: '889/2'),
      haveVisitor: false,
      recentlyUsedSceneId: '1',
      scenes: scenes,
    ),
    HomeOSProfile(
      home: Home(id: '3', addressNumber: '889/3'),
      haveVisitor: false,
      recentlyUsedSceneId: '1',
      scenes: scenes,
    ),
    HomeOSProfile(
      home: Home(id: '4', addressNumber: '889/4'),
      haveVisitor: true,
      recentlyUsedSceneId: '2',
      scenes: scenes,
    ),
  ];
}
