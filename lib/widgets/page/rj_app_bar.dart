// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/router/route_path_flow.dart';
import 'package:poc_sc_assistant/cubits/app_theme_cubit.dart';
import 'package:poc_sc_assistant/cubits/router_cubit.dart';
import 'package:poc_sc_assistant/widgets/page/rj_app_bar_action.dart';

// ignore: must_be_immutable
class RJAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: prefer_const_constructors_in_immutables
  RJAppBar({
    required this.colorAnimationController,
    Key? key,
    this.title,
    this.subtitle,
    this.leftWidgets = const [],
    this.actions = const [],
    this.onPressed,
    this.bottom,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTextStyle,
    this.shouldShowAppBarShadow = true,
    this.preExecutionOnPop,
    this.padding,
    this.actionGap,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTextStyle;
  final AnimationController colorAnimationController;
  final List<Widget> leftWidgets;
  final List<RJAppBarAction> actions;
  final Function()? onPressed;
  final PreferredSizeWidget? bottom;
  final bool shouldShowAppBarShadow;
  final Future<bool> Function()? preExecutionOnPop;
  final EdgeInsets? padding;
  final double? actionGap;

  late Animation _backgroundColorTween,
      _foregroundColorTween,
      _shadowColorTween;

  @override
  final Size preferredSize = const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final routerCubit = context.read<RouterCubit>();
    final theme = Theme.of(context).appBarTheme;

    _backgroundColorTween = ColorTween(
      end: theme.backgroundColor,
    ).animate(colorAnimationController);
    _foregroundColorTween = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(colorAnimationController);
    _shadowColorTween = ColorTween(
      begin: bottom != null ? theme.shadowColor : null,
      end: theme.shadowColor,
    ).animate(colorAnimationController);

    return AnimatedBuilder(
      animation: colorAnimationController,
      builder: (context, child) {
        return Container(
          decoration: shouldShowAppBarShadow
              ? BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: _shadowColorTween.value ?? Colors.transparent,
                      blurRadius: 15,
                      offset: const Offset(0, 0.75),
                    ),
                  ],
                )
              : null,
          child: Container(
            padding: padding,
            child: AppBar(
              leading:
                  routerCubit.canPop() ? _buildIconBackButton(context) : null,
              title: _buildBody(
                context,
                title: title,
                subtitle: subtitle,
                leftWidgets: leftWidgets,
                actions: actions,
              ),
              elevation: 0,
              backgroundColor:
                  _backgroundColorTween.value ?? Colors.transparent,
              foregroundColor: _foregroundColorTween.value,
              automaticallyImplyLeading: false,
              bottom: bottom,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context, {
    String? title,
    String? subtitle,
    List<Widget> leftWidgets = const [],
    List<RJAppBarAction> actions = const [],
  }) {
    final appTheme = context.read<AppThemeCubit>().state;
    final typography = appTheme.typography;

    return BlocBuilder<RouterCubit, List<RoutePathFlow>>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (onPressed != null) onPressed!();
          },
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  ..._buildWidgetsWithDivider(leftWidgets),
                  Visibility(
                    visible: leftWidgets.isNotEmpty,
                    child: const SizedBox(width: 12),
                  ),
                  Visibility(
                    visible: title != null || subtitle != null,
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: title != null,
                            child: Text(
                              title ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: titleTextStyle ??
                                  _getTextStyle(context, title ?? ''),
                            ),
                          ),
                          Visibility(
                            visible: subtitle != null,
                            child: Text(
                              subtitle ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: subtitleTextStyle ??
                                  typography.body2.copyWith(height: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: title == null && subtitle == null,
                    child: const Spacer(),
                  ),
                  ..._buildWidgetsWithDivider(
                    actions.map((action) => action.build(context)).toList(),
                    gap: actionGap,
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  TextStyle? _getTextStyle(BuildContext context, String title) {
    final routerCubit = context.read<RouterCubit>();
    final appTheme = context.read<AppThemeCubit>().state;
    final typography = appTheme.typography;

    if (routerCubit.canPop()) {
      if (title.length > 18) {
        return typography.headline4.copyWith(height: 1);
      } else {
        return typography.headline3.copyWith(height: 1);
      }
    } else {
      if (title.length > 18) {
        return typography.headline2.copyWith(height: 1);
      } else {
        return typography.headline1.copyWith(height: 1);
      }
    }
  }

  List<Widget> _buildWidgetsWithDivider(
    List<Widget> widgets, {
    double? gap,
  }) {
    if (widgets.isEmpty) return [];

    final indexes = List.generate((widgets.length * 2) - 1, (i) => i);

    return indexes.map((index) {
      if (index.isEven) {
        return widgets[index ~/ 2];
      } else {
        return SizedBox(width: gap ?? 12);
      }
    }).toList();
  }

  Widget _buildIconBackButton(BuildContext context) {
    final routerCubit = context.read<RouterCubit>();
    final appTheme = context.read<AppThemeCubit>().state;

    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: appTheme.fontColor.textDefault,
        size: 25,
      ),
      onPressed: () async {
        final preExecutionSuccess = await preExecutionOnPop?.call() ?? true;

        if (preExecutionSuccess) routerCubit.pop();
      },
    );
  }
}
