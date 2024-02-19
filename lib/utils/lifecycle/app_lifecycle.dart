import 'package:flutter/widgets.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({
    required this.resumeCallBack,
    required this.detachedCallBack,
  });

  final Function resumeCallBack;
  final Function detachedCallBack;

//  @override
//  Future<bool> didPopRoute()

//  @override
//  void didHaveMemoryPressure()

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        await detachedCallBack();
        break;
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;
    }
  }
}
