import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/pages/home/home_page_presenter.dart';
import 'package:poc_sc_assistant/widgets/page/page_scaffold.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final presenter = HomePagePresenter.fromModel();

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'BB-WGS',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: presenter.homes
              .map((home) => _buildHomeCard(context, home: home))
              .intersperse(const SizedBox(height: 16))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildHomeCard(
    BuildContext context, {
    required Home home,
  }) {
    return _buildCardDecoration(
      context,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHomeAddress(context, address: home.address),
                const SizedBox(height: 4),
                _buildHomeCurrentScene(context, currentScene: home.currentScene)
              ],
            ),
          ),
          const Spacer(),
          _buildActionButton(context, isStarted: home.isStarted)
        ],
      ),
    );
  }

  Widget _buildCardDecoration(
    BuildContext context, {
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _buildHomeAddress(
    BuildContext context, {
    required String address,
  }) {
    return Text(
      'บ้านตัวอย่าง $address',
      style: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildHomeCurrentScene(
    BuildContext context, {
    required String currentScene,
  }) {
    return Text(
      'Scene ล่าสุด : $currentScene',
      style: const TextStyle(
        color: Color(0xFF828282),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required bool isStarted,
  }) {
    final color = isStarted ? Colors.red : const Color(0xFF3555FF);
    final label = isStarted ? 'Stop' : 'Start';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
