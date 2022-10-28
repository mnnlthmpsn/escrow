import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.maxLength,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      style: theme.textTheme.bodyText1
          ?.copyWith(fontSize: AppDimens.kCaptionTextFont),
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      validator: validator,
      cursorColor: AppColors.kPrimaryTextColor,
      cursorWidth: .8,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.caption
            ?.copyWith(fontSize: AppDimens.kSmallTextFont),
        errorStyle: theme.textTheme.caption?.copyWith(
            color: Colors.redAccent, fontSize: AppDimens.kSmallTextFont),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.kSpacingMiddle,
        ),
          errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.kDefaultBorderRadius),
              borderSide:
              const BorderSide(color: AppColors.kErrorColor, width: .8)),
          enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.kDefaultBorderRadius),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.kDefaultBorderRadius),
              borderSide: const BorderSide(
                  color: AppColors.kPrimaryColor, width: .8))
      ),
    );
  }
}
