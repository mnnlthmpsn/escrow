import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  final String title;
  final IconData? icon;
  final Color? color;

  const CategoryCard({Key? key, required this.title, this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: color ?? AppColors.kPrimaryColor
      ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
          margin:
              const EdgeInsets.symmetric(vertical: AppDimens.kSpacingMedium),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.kLightColor),
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppDimens.kDefaultBorderRadius))),
          child: Row(
            children: [
              _iconBuilder(context),
              const SizedBox(width: AppDimens.kSpacingMLarge),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text('Information one', style: Theme.of(context).textTheme.caption)
                ],
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_right_alt)
                    ],
                  )
              )
            ],
          ),
        ));
  }

  Widget _iconBuilder(BuildContext context) {
    return Container(
      width: AppDimens.kSpacingXXXXlarge,
      height: AppDimens.kSpacingXXXXlarge,
      decoration: BoxDecoration(
        color: color != null ? color!.withOpacity(.15) : AppColors.kPrimaryColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(AppDimens.kDefaultBorderRadius),
      ),
      child: Icon(
        icon ?? Icons.settings,
        color: color ?? AppColors.kPrimaryColor,
      ),
    );
  }
}
