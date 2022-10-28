import 'package:escrow/features/auth/login/screen.dart';
import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Icons.home_rounded,
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: AppColors.kPrimaryColor,
    );
  }
}
