import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget {

  final String label;
  final IconButton? menu;
  final Color? textColor;
  final Color? iconColor;

  const KAppBar({Key? key, required this.label, this.menu, this.textColor, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: textColor ?? AppColors.kPrimaryTextColor, fontSize: AppDimens.kCaptionTextFont)),
          menu ?? _menu
        ],
      ),
    );
  }

  Widget get _menu {
    return IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: iconColor ?? AppColors.kIconColor));
  }
}
