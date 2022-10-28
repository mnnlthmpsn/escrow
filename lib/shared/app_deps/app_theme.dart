import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.kLightColor,
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodyText1: kNormalTextStyle,
          bodyText2: kNormalTextStyle,
        )),
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark));
  }

  static IconThemeData kIconStyle =
      const IconThemeData(size: AppDimens.kDefaultIconSize, color: Colors.blue);

  // Text styles
  // title
  static TextStyle kTitleTextStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.kHeading6TextFont,
      color: AppColors.kPrimaryTextColor);

  // body
  static TextStyle kNormalTextStyle = const TextStyle(
      fontSize: AppDimens.kBodyTextFont, color: AppColors.kPrimaryTextColor);

  // subtitle
  static TextStyle kSubTitleTextStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.kCaptionTextFont,
      color: AppColors.kSubTitleColor);
}
