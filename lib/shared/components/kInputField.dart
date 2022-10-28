import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:flutter/material.dart';

class KTextInput extends StatefulWidget {
  final String label;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? isPassword;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool? skipValidation;
  final Widget? prefix;
  final Function onChanged;

  const KTextInput(
      {Key? key,
      this.textInputAction,
      this.textInputType,
      this.isPassword = false,
      this.skipValidation = false,
      this.prefix,
      this.onTap,
      required this.label,
      required this.onChanged,
      this.controller})
      : super(key: key);

  @override
  State<KTextInput> createState() => _KTextInputState();
}

class _KTextInputState extends State<KTextInput> {
  bool filled = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() => filled = !_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) => widget.onChanged,
        onTap: widget.onTap ?? () => setState(() => filled = false),
        validator: (value) {
          if (widget.skipValidation == true) {
            return null;
          } else {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.label}';
            }
            return null;
          }
        },
        focusNode: _focusNode,
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: AppColors.kPrimaryTextColor.withOpacity(.8)),
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        keyboardType: widget.textInputType ?? TextInputType.text,
        obscureText: widget.isPassword!,
        cursorWidth: 1,
        cursorColor: AppColors.kSecondaryColor,
        decoration: InputDecoration(
            prefix: widget.prefix,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              widget.label,
              style: TextStyle(
                  color: filled
                      ? AppColors.kPrimaryTextColor
                      : AppColors.kPrimaryColor.withOpacity(.8)),
            ),
            // fillColor: AppColors.kPrimaryColor.withOpacity(.08),
            // filled: filled,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.kDefaultBorderRadius),
                borderSide:
                    const BorderSide(color: AppColors.kErrorColor, width: .5)),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.kDefaultBorderRadius),
                borderSide: const BorderSide(
                    color: AppColors.kPrimaryColor, width: .5)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.kDefaultBorderRadius),
                borderSide: const BorderSide(
                    color: AppColors.kPrimaryColor, width: .5))),
      ),
    );
  }
}
