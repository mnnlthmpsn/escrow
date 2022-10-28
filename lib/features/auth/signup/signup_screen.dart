import 'package:custom_timer/custom_timer.dart';
import 'package:escrow/features/auth/signup/signup_bloc.dart';
import 'package:escrow/features/auth/signup/signup_events.dart';
import 'package:escrow/features/auth/signup/signup_state.dart';
import 'package:escrow/generated/assets.dart';
import 'package:escrow/shared/app_deps/app_colors.dart';
import 'package:escrow/shared/app_deps/app_dimens.dart';
import 'package:escrow/shared/components/kAuthLayout.dart';
import 'package:escrow/shared/components/kButton.dart';
import 'package:escrow/shared/components/kInputField.dart';
import 'package:escrow/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:steps_indicator/steps_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final CustomTimerController controller = CustomTimerController();

  final GlobalKey<FormState> _basicDetailFormKey = GlobalKey();
  final GlobalKey<FormState> _extraInfoFormKey = GlobalKey();
  final GlobalKey<FormState> _addressInfoFormKey = GlobalKey();
  final GlobalKey<FormState> _authInfoFormKey = GlobalKey();

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
        bgImage: Assets.svgBike,
        child: Column(
      children: [
        const SizedBox(
          height: AppDimens.kSpacingXlarge,
        ),
        _stepsIndicator,
        const SizedBox(height: AppDimens.kSpacingXlarge),
        BlocBuilder<SignUpBloc, SignUpState>(
            builder: (BuildContext context, SignUpState state) {
          switch (state.selectedStep) {
            case 0:
              return _basicDetailsForm;
            case 1:
              return _extraInfoForm;
            case 2:
              return _addressInfoForm;
            case 3:
              return _auth_form;
            default:
              return _otpForm;
          }
        }),
        _submitBtn
      ],
    ));
  }

  // -------------- BASIC DETAILS ----------------- //
  Widget get _basicDetailsForm {
    return Form(
      key: _basicDetailFormKey,
      child: Column(
        children: [
          _basicDetailFormLabel,
          const SizedBox(height: AppDimens.kSpacingMLarge),
          _firstname,
          _middlename,
          _lastname,
          _phone
        ],
      ),
    );
  }

  Widget get _basicDetailFormLabel {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.kDefaultPadding),
      child: Text(
        "Please share basic details about yourself for a tailored experience",
        style: TextStyle(fontSize: AppDimens.kCaptionTextFont),
      ),
    );
  }

  Widget get _firstname {
    return KTextInput(
      label: "Firstname",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(FirstNameChanged(firstName: value.trim())),
    );
  }

  Widget get _middlename {
    return KTextInput(
      label: "Middle Name",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(MiddleNameChanged(middleName: value.tri())),
    );
  }

  Widget get _lastname {
    return KTextInput(
      label: "Lastname",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(LastNameChanged(lastName: value.trim())),
    );
  }

  Widget get _phone {
    return KTextInput(
      label: "Phone",
      onChanged: (value) =>
          context.read<SignUpBloc>().add(PhoneChanged(phone: value.trim())),
    );
  }

  // -------------- BASIC DETAILS ----------------- //
  Widget get _extraInfoForm {
    return Form(
      key: _extraInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _idDetailFormLabel,
          const SizedBox(height: AppDimens.kSpacingMLarge),
          _email,
          _sex,
          _id_type,
          _id_number
        ],
      ),
    );
  }

  Widget get _idDetailFormLabel {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.kDefaultPadding),
      child: Text(
        "Please share more details about yourself...",
        style: TextStyle(fontSize: AppDimens.kCaptionTextFont),
      ),
    );
  }

  Widget get _email {
    return KTextInput(
      label: "Email",
      onChanged: (value) =>
          context.read<SignUpBloc>().add(EmailChanged(email: value.trim())),
    );
  }

  Widget get _sex {
    return KTextInput(
      label: "Sex",
      onChanged: (value) =>
          context.read<SignUpBloc>().add(SexChanged(sex: value.trim())),
    );
  }

  Widget get _id_type {
    return KTextInput(
      label: "ID Type",
      onChanged: (value) =>
          context.read<SignUpBloc>().add(IDTypeChanged(idType: value.trim)),
    );
  }

  Widget get _id_number {
    return KTextInput(
      label: "ID Number",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(IDNumberChanged(idNumber: value.trim())),
    );
  }

  // -------------- EXTRA INFO -------------------- //
  Widget get _addressInfoForm {
    return Form(
      key: _addressInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _addressFormLabel,
          const SizedBox(height: AppDimens.kSpacingMLarge),
          _res_address,
          _gps_address,
          _region,
          _town
        ],
      ),
    );
  }

  Widget get _addressFormLabel {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.kDefaultPadding),
      child: Text(
        "Address Info Details...",
        style: TextStyle(fontSize: AppDimens.kCaptionTextFont),
      ),
    );
  }

  Widget get _res_address {
    return KTextInput(
      label: "Residential Address",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(ResidentialAddressChanged(resAddress: value.trim())),
    );
  }

  Widget get _gps_address {
    return KTextInput(
      label: "GPS Address",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(GPSAddressChanged(gpsPost: value.trim())),
    );
  }

  Widget get _region {
    return KTextInput(
      label: "Region",
      onChanged: (value) =>
          context.read<SignUpBloc>().add(RegionChanged(region: value.trim())),
    );
  }

  Widget get _town {
    return KTextInput(
      label: "Town",
      onChanged: (value) =>
          context.read<SignUpBloc>().add(TownChanged(town: value.trim())),
    );
  }

  // -------------- EXTRA INFO -------------------- //
  Widget get _auth_form {
    return Form(
      key: _authInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _password,
          _confirm_password,
        ],
      ),
    );
  }

  Widget get _password {
    return KTextInput(
      label: "Password",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(PasswordChanged(password: value.trim())),
    );
  }

  Widget get _confirm_password {
    return KTextInput(
      label: "Confirm Password",
      onChanged: (value) => context
          .read<SignUpBloc>()
          .add(ConfirmPasswordChanged(password2: value.trim())),
    );
  }

  // -------------- AUTH AUTH -------------------- //
  Widget get _otpForm {
    return Column(
      children: [
        _otpLabel,
        const SizedBox(height: AppDimens.kSpacingXXlarge),
        Pinput(
          showCursor: false,
          length: 6,
          onChanged: (value) =>
              context.read<SignUpBloc>().add(OTPChanged(authCode: value)),
        ),
        const SizedBox(height: AppDimens.kSpacingXlarge),
        CustomTimer(
            controller: controller,
            begin: const Duration(seconds: 51),
            end: const Duration(),
            builder: (time) {
              controller.start();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${time.minutes}:${time.seconds}",
                      style:
                          const TextStyle(fontSize: AppDimens.kSmallTextFont)),
                  Visibility(
                      visible: time.duration == const Duration(),
                      child: const InkWell(
                        child: Text("Resend OTP",
                            style: TextStyle(
                                fontSize: AppDimens.kCaptionTextFont)),
                      ))
                ],
              );
            }),
        const SizedBox(height: AppDimens.kSpacingXXlarge),
      ],
    );
  }

  Widget get _otpLabel {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.kDefaultPadding),
      child: Text(
          "An OTP has been sent to 0540609437. Please enter the code below",
          style: TextStyle(fontSize: AppDimens.kCaptionTextFont)),
    );
  }

  // -------------------- OTP --------------------- //
  Widget get _submitBtn {
    return BlocBuilder<SignUpBloc, SignUpState>(
        builder: (BuildContext context, SignUpState state) {
      return Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: KButton(
            label: 'Continue',
            onPressed: () {
              switch (context.read<SignUpBloc>().state.selectedStep) {
                case 0:
                  context.read<SignUpBloc>().add(BasicDetailFormSubmitted(
                      basicDetailFormKey: _basicDetailFormKey));
                  break;
                case 1:
                  context.read<SignUpBloc>().add(ExtraInfoFormSubmitted(
                      extraInfoFormKey: _extraInfoFormKey));
                  break;
                case 2:
                  context.read<SignUpBloc>().add(AddressInfoFormSubmitted(
                      addressInfoFormKey: _addressInfoFormKey));
                  break;
                case 3:
                  context.read<SignUpBloc>().add(
                      AuthInfoFormSubmitted(authInfoFormKey: _authInfoFormKey));
                  break;
                default:
                  context.read<SignUpBloc>().add(const FinalFormSubmission());
                  break;
              }
            },
            labelColor: AppColors.kLightColor,
          ));
    });
  }

  // -------------- SUBMIT ------------------------ //
  Widget get _stepsIndicator {
    return BlocBuilder<SignUpBloc, SignUpState>(
        builder: (BuildContext context, SignUpState state) {
      return SizedBox(
        width: ScreenSize.getWidth(context),
        child: StepsIndicator(
          selectedStep: state.selectedStep,
          nbSteps: state.nbSteps,
          selectedStepWidget: _activeStepperIcon(false),
          doneStepWidget: _activeStepperIcon(true),
          unselectedStepWidget: _activeStepperIcon(false),
          undoneLineColor: AppColors.kInactiveColor,
          doneStepColor: AppColors.kPrimaryColor,
          doneLineColor: AppColors.kPrimaryColor,
          doneLineThickness: 2,
          undoneLineThickness: .5,
          lineLength: ScreenSize.getWidth(context) * .08,
        ),
      );
    });
  }

  Widget _activeStepperIcon(bool active) {
    return Container(
      width: 16,
      height: 16,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: active ? AppColors.kPrimaryColor : AppColors.kAppLayoutBackground,
          borderRadius: const BorderRadius.all(Radius.circular(100)), border: Border.all(color: AppColors.kPrimaryColor)),
      child: active
          ? Icon(Icons.check, color: active ? AppColors.kLightColor : AppColors.kPrimaryColor, size: 10)
          : const SizedBox.shrink(),
    );
  }
}
