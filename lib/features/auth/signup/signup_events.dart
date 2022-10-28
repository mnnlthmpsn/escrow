import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:escrow/features/auth/signup/signup_state.dart';
import 'package:escrow/shared/shared_events/form_submission.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class FirstNameChanged extends SignUpEvent {
  final String firstName;
  const FirstNameChanged({required this.firstName});

  @override
  List<Object> get props => [firstName];
}

class MiddleNameChanged extends SignUpEvent {
  final String middleName;
  const MiddleNameChanged({required this.middleName});

  @override
  List<Object> get props => [middleName];
}

class LastNameChanged extends SignUpEvent {
  final String lastName;
  const LastNameChanged({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class EmailChanged extends SignUpEvent {
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PhoneChanged extends SignUpEvent {
  final String phone;
  const PhoneChanged({required this.phone});

  @override
  List<Object> get props => [phone];
}

class IDTypeChanged extends SignUpEvent {
  final String idType;
  const IDTypeChanged({required this.idType});

  @override
  List<Object> get props => [idType];
}

class IDNumberChanged extends SignUpEvent {
  final String idNumber;
  const IDNumberChanged({required this.idNumber});

  @override
  List<Object> get props => [idNumber];
}

class SexChanged extends SignUpEvent {
  final String sex;
  const SexChanged({required this.sex});

  @override
  List<Object> get props => [sex];
}

class ResidentialAddressChanged extends SignUpEvent {
  final String resAddress;
  const ResidentialAddressChanged({required this.resAddress});

  @override
  List<Object> get props => [];
}

class GPSAddressChanged extends SignUpEvent {
  final String gpsPost;
  const GPSAddressChanged({required this.gpsPost});

  @override
  List<Object> get props => [];
}

class RegionChanged extends SignUpEvent {
  final String region;
  const RegionChanged({required this.region});

  @override
  List<Object> get props => [region];
}

class TownChanged extends SignUpEvent {
  final String town;
  const TownChanged({required this.town});

  @override
  List<Object> get props => [town];
}

class PasswordChanged extends SignUpEvent {
  final String password;
  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends SignUpEvent {
  final String password2;
  const ConfirmPasswordChanged({required this.password2});

  @override
  List<Object> get props => [password2];
}

class OTPChanged extends SignUpEvent {
  final String authCode;
  const OTPChanged({required this.authCode});

  @override
  List<Object> get props => [authCode];
}

class StepChanged extends SignUpEvent {
  final StepDirection direction;
  const StepChanged({required this.direction});

  @override
  List<Object> get props => [direction];
}

class BasicDetailFormSubmitted extends SignUpEvent {
  final GlobalKey<FormState> basicDetailFormKey;
  const BasicDetailFormSubmitted({required this.basicDetailFormKey});

  @override
  List<Object> get props => [basicDetailFormKey];
}

class ExtraInfoFormSubmitted extends SignUpEvent {
  final GlobalKey<FormState> extraInfoFormKey;
  const ExtraInfoFormSubmitted({required this.extraInfoFormKey});

  @override
  List<Object> get props => [extraInfoFormKey];
}

class AddressInfoFormSubmitted extends SignUpEvent {
  final GlobalKey<FormState> addressInfoFormKey;
  const AddressInfoFormSubmitted({required this.addressInfoFormKey});

  @override
  List<Object> get props => [addressInfoFormKey];
}

class AuthInfoFormSubmitted extends SignUpEvent {
  final GlobalKey<FormState> authInfoFormKey;
  const AuthInfoFormSubmitted({required this.authInfoFormKey});

  @override
  List<Object> get props => [authInfoFormKey];
}

class FinalFormSubmission extends SignUpEvent {
  const FinalFormSubmission();
}
