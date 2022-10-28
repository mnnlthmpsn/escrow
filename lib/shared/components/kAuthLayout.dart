import 'package:escrow/generated/assets.dart';
import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:escrow/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KAuthLayout extends StatelessWidget {
  final String bgImage;
  const KAuthLayout({Key? key, required this.child, required this.bgImage}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: AppColors.kPrimaryColor.withOpacity(.08),
            alignment: Alignment.center,
            height: ScreenSize.getHeight(context) * .3,
            child: SvgPicture.asset(bgImage)
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.kDefaultPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: child,
              )),
        )
      ],
    );
  }
}
