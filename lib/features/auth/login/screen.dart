import 'package:escrow/generated/assets.dart';
import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:escrow/shared/components/kAuthLayout.dart';
import 'package:escrow/shared/components/kButton.dart';
import 'package:escrow/shared/components/kInputField.dart';
import 'package:escrow/shared/utils/helpers.dart';
import 'package:escrow/shared/utils/route_constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kAppLayoutBackground,
      body: SafeArea(
        child: _body,
      ),
    );
  }

  Widget get _body {
    return KAuthLayout(
        bgImage: Assets.svgBuyingHouse,
        child: Column(children: [
          const SizedBox(height: AppDimens.kSpacingXXlarge),
          _logoDesc,
          const SizedBox(height: AppDimens.kSpacingXXlarge),
          _loginForm,
          const SizedBox(height: AppDimens.kSpacingMedium),
          _forgotPassword,
          const SizedBox(height: AppDimens.kSpacingXXlarge),
          _divider,
          const SizedBox(height: AppDimens.kSpacingMedium),
          _signUp,
          const SizedBox(height: AppDimens.kSpacingXXlarge),
          _privacyPolicy,
          const SizedBox(height: AppDimens.kSpacingXXlarge),
        ]));
  }

  Widget get _logoDesc {
    return Column(
      children: const <Widget>[
        Icon(
          Icons.monetization_on,
          size: AppDimens.kSpacingXXXXlarge,
        ),
        Text('Enjoy safe and simple transaction',
            style: TextStyle(
                fontSize: AppDimens.kSmallTextFont,
                color: AppColors.kSubTitleColor))
      ],
    );
  }

  Widget get _loginForm {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          KTextInput(
            label: "Username",
            onChanged: () {},
          ),
          KTextInput(
            label: "Password",
            textInputAction: TextInputAction.done,
            isPassword: true,
            onChanged: () {},
          ),
          _submitBtn
        ],
      ),
    );
  }

  Widget get _submitBtn {
    return Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: KButton(
          label: 'Log In',
          onPressed: () => Helpers.newPageDestroyPrevious(
              context, RouteConstants.kDashboard),
          labelColor: AppColors.kLightColor,
        ));
  }

  Widget get _forgotPassword {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          InkWell(
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: AppDimens.kSmallTextFont),
            ),
          )
        ],
      ),
    );
  }

  Widget get _divider {
    return IntrinsicWidth(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .25,
            height: .5,
            color: AppColors.kPrimaryTextColor,
          ),
          const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimens.kSpacingXXlarge),
            child: Text(
              'OR',
              style: TextStyle(
                  fontSize: AppDimens.kCaptionTextFont,
                  color: AppColors.kSubTitleColor),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .25,
            height: .5,
            color: AppColors.kPrimaryTextColor,
          ),
        ],
      ),
    );
  }

  Widget get _signUp {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: InkWell(
          onTap: () => Helpers.newPage(context, RouteConstants.kSignUp),
          child: Text('Create an Account',
              style: Theme.of(context).textTheme.caption),
        ));
  }

  Widget get _privacyPolicy {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
            text: 'By signing up, you agree to our ',
            style: TextStyle(
                fontFamily: 'TFors',
                fontSize: AppDimens.kSmallTextFont,
                color: AppColors.kPrimaryTextColor),
            children: [
              WidgetSpan(
                  child: InkWell(
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: AppDimens.kSmallTextFont),
                ),
              ))
            ]));
  }
}
