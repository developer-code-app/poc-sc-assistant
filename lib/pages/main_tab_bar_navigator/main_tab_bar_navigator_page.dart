import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/app/router/paths/home_route_path.dart';
import 'package:poc_sc_assistant/app/router/paths/scenes_route_path.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/widgets/page/page_scaffold.dart';

class MainTabBarNavigatorPage extends StatefulWidget {
  const MainTabBarNavigatorPage({super.key});

  @override
  State<MainTabBarNavigatorPage> createState() =>
      _MainTabBarNavigatorPageState();
}

class _MainTabBarNavigatorPageState extends State<MainTabBarNavigatorPage> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late List<RoutePath> _routePaths;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _routePaths = [
      HomeRoutePath(),
      ScenesRoutePath(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      shouldShowAppBar: false,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Scene',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: _buildPage,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget? _buildPage(BuildContext context, int index) {
    return _routePaths[index].buildPage(context);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
}
