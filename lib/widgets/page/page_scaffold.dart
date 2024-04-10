import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/widgets/page/rj_app_bar.dart';
import 'package:poc_sc_assistant/widgets/page/rj_app_bar_action.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({
    Key? key,
    this.title,
    this.subtitle,
    this.search,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.child,
    this.shouldShowAppBar = true,
    this.enableSafeArea = true,
    this.scrollListener,
    this.actions = const [],
    this.onTap,
    this.onLongPressAtBody,
    this.preExecutionOnPop,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.isSafeAreaBottom,
    this.resizeToAvoidBottomInset = true,
    this.leftWidgetsAppBar = const [],
    this.appBarActionGap,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final Widget? search;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Widget? child;
  final bool shouldShowAppBar;
  final bool enableSafeArea;
  final bool Function(ScrollNotification)? scrollListener;
  final List<RJAppBarAction> actions;
  final Function()? onTap;
  final void Function()? onLongPressAtBody;
  final Future<bool> Function()? preExecutionOnPop;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool? isSafeAreaBottom;
  final bool resizeToAvoidBottomInset;
  final List<Widget> leftWidgetsAppBar;
  final double? appBarActionGap;

  @override
  PageScaffoldState createState() => PageScaffoldState();
}

class PageScaffoldState extends State<PageScaffold>
    with TickerProviderStateMixin {
  late AnimationController _appBarAnimationController;

  @override
  void initState() {
    super.initState();

    _appBarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _appBarAnimationController.dispose();
    super.dispose();
  }

  void _hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  bool scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis != Axis.vertical) return false;
    _appBarAnimationController.animateTo(scrollInfo.metrics.pixels / 80);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: widget.scrollListener ?? scrollListener,
      child: Scaffold(
        appBar: (widget.shouldShowAppBar)
            ? RJAppBar(
                title: widget.title,
                subtitle: widget.subtitle,
                titleTextStyle: widget.titleTextStyle,
                subtitleTextStyle: widget.subtitleTextStyle,
                colorAnimationController: _appBarAnimationController,
                actions: widget.actions,
                preExecutionOnPop: widget.preExecutionOnPop,
                leftWidgets: widget.leftWidgetsAppBar,
                actionGap: widget.appBarActionGap,
              )
            : null,
        body: GestureDetector(
          onTap: widget.onTap ?? _hideKeyboard,
          onLongPress: widget.onLongPressAtBody,
          child: Column(
            children: [
              Expanded(
                child: (widget.enableSafeArea)
                    ? SafeArea(
                        bottom: widget.isSafeAreaBottom ?? true,
                        child: Container(child: widget.child),
                      )
                    : Container(child: widget.child),
              ),
            ],
          ),
        ),
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      ),
    );
  }
}
