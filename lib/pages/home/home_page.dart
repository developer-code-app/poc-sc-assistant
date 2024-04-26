import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/pages/home/bloc/home_page_bloc.dart';
import 'package:poc_sc_assistant/pages/home/home_page_presenter.dart'
    as presenter;
import 'package:poc_sc_assistant/widgets/page/page_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'BB-WGS',
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is LoadSuccessState) {
            return _buildLoadSuccess(context, state);
          } else if (state is LoadInProgressState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadFailureState) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoadSuccess(
    BuildContext context,
    LoadSuccessState state,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        children: state.presenter.homes
            .map((home) => _buildHomeCard(context, home: home))
            .intersperse(const SizedBox(height: 16))
            .toList(),
      ),
    );
  }

  Widget _buildHomeCard(
    BuildContext context, {
    required presenter.Home home,
  }) {
    final recentlyUsedScene = home.recentlyUsedScene;

    return _buildCardDecoration(
      context,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHomeAddress(context, address: home.addressNumber),
                const SizedBox(height: 4),
                if (recentlyUsedScene != null)
                  _buildRecentlyUsedScene(
                    context,
                    recentlyUsedScene: recentlyUsedScene,
                  )
              ],
            ),
          ),
          const Spacer(),
          _buildActionSceneButton(
            context,
            homeId: home.id,
            haveVisitor: home.haveVisitor,
          )
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

  Widget _buildRecentlyUsedScene(
    BuildContext context, {
    required String recentlyUsedScene,
  }) {
    return Text(
      'Scene ล่าสุด : $recentlyUsedScene',
      style: const TextStyle(
        color: Color(0xFF828282),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildActionSceneButton(
    BuildContext context, {
    required String homeId,
    required bool haveVisitor,
  }) {
    final color = haveVisitor ? Colors.red : const Color(0xFF3555FF);
    final label = haveVisitor ? 'Stop' : 'Start';
    final bloc = context.read<HomePageBloc>();

    return GestureDetector(
      onTap: () => bloc.add(SceneActionRequestedEvent(homeId: homeId)),
      child: Container(
        width: 90,
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
      ),
    );
  }
}
