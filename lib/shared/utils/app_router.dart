import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:escrow/shared/utils/route_constants.dart';

// load screens
import '../../features/load_screens.dart';

class AppRouter {
  static Route<dynamic> generateRoute(settings) {
    switch (settings.name) {
      case RouteConstants.kSplash:
        return animatePage(const SplashScreen());
      case RouteConstants.kLogin:
        return animatePage(const LoginScreen());
      case RouteConstants.kSignUp:
        return animatePage(SignUpOutlet);
      case RouteConstants.kDashboard:
        return animatePage(const DashboardScreen());
      default:
        return animatePage(const Center(child: Text('Nothing here')));
    }
  }

  static PageTransition animatePage(Widget child,
      {PageTransitionType transition = PageTransitionType.fade}) {
    return PageTransition(
        child: child,
        type: transition,
        duration: const Duration(microseconds: 250),
        reverseDuration: const Duration(microseconds: 250));
  }
}
