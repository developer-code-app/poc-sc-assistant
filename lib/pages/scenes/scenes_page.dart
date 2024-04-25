import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/gen/assets.gen.dart';
import 'package:poc_sc_assistant/pages/scenes/bloc/scenes_page_bloc.dart';
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
            return _buildLoadSuccess(context);
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

  Widget _buildLoadSuccess(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHomeAddress(context, address: '889/1'),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: 168 / 131,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildSceneCard(context),
              _buildSceneCard(context),
              _buildSceneCard(context),
            ],
          ),
        ],
      ),
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
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSceneCard(BuildContext context) {
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
            _buildSceneIcon(context),
            const SizedBox(height: 16),
            _buildSceneName(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSceneName(BuildContext context) {
    return const Text(
      'Standby',
      style: TextStyle(
        color: Color(0xFF202020),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSceneIcon(BuildContext context) {
    return Container(
      child: Assets.icons.standby.svg(),
    );
  }
}
