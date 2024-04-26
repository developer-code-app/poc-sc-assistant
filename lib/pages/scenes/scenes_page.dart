import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/pages/scenes/bloc/scenes_page_bloc.dart';
import 'package:poc_sc_assistant/pages/scenes/scenes_page_presenter.dart';
import 'package:poc_sc_assistant/widgets/page/page_scaffold.dart';

class ScenesPage extends StatelessWidget {
  const ScenesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      shouldShowAppBar: false,
      child: BlocBuilder<ScenesPageBloc, ScenesPageState>(
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
    final presenter = state.presenter;

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      children: presenter.homes.map((home) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildHomeAddress(context, addressNumber: home.addressNumber),
          const SizedBox(height: 16),
          _buildScenes(context, scenes: home.scenes),
          const SizedBox(height: 24),
        ]);
      }).toList(),
    );
  }

  Widget _buildHomeAddress(
    BuildContext context, {
    required String addressNumber,
  }) {
    return Text(
      'บ้านตัวอย่าง $addressNumber',
      style: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildScenes(
    BuildContext context, {
    required List<Scene> scenes,
  }) {
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: 168 / 131,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: scenes
          .map((scene) => _buildSceneCard(context, scene: scene))
          .toList(),
    );
  }

  Widget _buildSceneCard(
    BuildContext context, {
    required Scene scene,
  }) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSceneIcon(
              context,
              iconUrl: scene.iconUrl,
            ),
            const SizedBox(height: 16),
            _buildSceneName(context, name: scene.name),
          ],
        ),
      ),
    );
  }

  Widget _buildSceneName(
    BuildContext context, {
    required String name,
  }) {
    return Text(
      name,
      style: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSceneIcon(
    BuildContext context, {
    required String iconUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        width: 32,
        height: 32,
        iconUrl,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, exception, stackTrace) {
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
