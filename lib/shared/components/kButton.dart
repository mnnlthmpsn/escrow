import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? outlineColor;
  final bool? isLoading;
  final VoidCallback onPressed;

  const KButton(
      {Key? key,
        required this.label,
        this.backgroundColor,
        this.labelColor,
        this.outlineColor,
        this.isLoading = false,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: labelColor ?? AppColors.kLightColor,
            backgroundColor: backgroundColor ?? AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: outlineColor ?? AppColors.kPrimaryColor, width: outlineColor != null ? 1 : 0),
                borderRadius:
                BorderRadius.circular(AppDimens.kDefaultBorderRadius))),
        child: isLoading == true ?
        const Text('...loading') :
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: labelColor ?? AppColors.kLightColor),
        ),
      ),
    );
  }
}