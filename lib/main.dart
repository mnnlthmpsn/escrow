import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_theme.dart';
import 'package:escrow/shared/utils/app_router.dart';
import 'package:escrow/shared/utils/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.kPrimaryColor
    ));
    return MaterialApp(
      title: 'Escrow App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      navigatorKey: _navigatorKey,
      initialRoute: RouteConstants.kLogin,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
