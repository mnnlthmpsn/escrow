import 'package:escrow/features/auth/signup/signup_events.dart';
import 'package:escrow/features/auth/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<MiddleNameChanged>(_onMiddleNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<EmailChanged>(_onEmailChanged);
    on<IDTypeChanged>(_onIDTypeChanged);
    on<IDNumberChanged>(_onIDNumberChanged);
    on<SexChanged>(_onSexChanged);
    on<ResidentialAddressChanged>(_onResidentialAddressChanged);
    on<GPSAddressChanged>(_onGPSAddressChanged);
    on<RegionChanged>(_onRegionChange);
    on<TownChanged>(_onTownChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<StepChanged>(_onStepChanged);
    on<BasicDetailFormSubmitted>(_onBasicDetailFormSubmitted);
    on<ExtraInfoFormSubmitted>(_onExtraInfoFormSubmitted);
    on<AddressInfoFormSubmitted>(_onAddressDetailFormSubmitted);
    on<AuthInfoFormSubmitted>(_onAuthInfoFormSubmitted);
    on<FinalFormSubmission>(_onFinalFormSubmission);
  }

  void _onFirstNameChanged(FirstNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _onMiddleNameChanged(
      MiddleNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(middleName: event.middleName));
  }

  void _onLastNameChanged(LastNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onIDTypeChanged(IDTypeChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(idType: event.idType));
  }

  void _onIDNumberChanged(IDNumberChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(idNumber: event.idNumber));
  }

  void _onSexChanged(SexChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(sex: event.sex));
  }

  void _onResidentialAddressChanged(
      ResidentialAddressChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(resAddress: event.resAddress));
  }

  void _onGPSAddressChanged(
      GPSAddressChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(gpsPost: event.gpsPost));
  }

  void _onRegionChange(RegionChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(region: event.region));
  }

  void _onTownChanged(TownChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(town: event.town));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password2: event.password2));
  }

  // stepper helpers
  void _onStepChanged(StepChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(selectedStep: state.selectedStep + 1));
  }

  void _onBasicDetailFormSubmitted(
      BasicDetailFormSubmitted event, Emitter<SignUpState> emit) {
    if (event.basicDetailFormKey.currentState!.validate()) {
      add(const StepChanged(direction: StepDirection.forward));
    }
  }

  void _onExtraInfoFormSubmitted(
      ExtraInfoFormSubmitted event, Emitter<SignUpState> emit) {
    add(const StepChanged(direction: StepDirection.forward));
  }

  void _onAddressDetailFormSubmitted(
      AddressInfoFormSubmitted event, Emitter<SignUpState> emit) {
    if (event.addressInfoFormKey.currentState!.validate()) {
      // make sign up request call here
      add(const StepChanged(direction: StepDirection.forward));
    }
  }

  void _onAuthInfoFormSubmitted(
      AuthInfoFormSubmitted event, Emitter<SignUpState> emit) {
    if (event.authInfoFormKey.currentState!.validate()) {
      add(const StepChanged(direction: StepDirection.forward));
    }
  }

  void _onFinalFormSubmission(
      FinalFormSubmission event, Emitter<SignUpState> emit) {
    // validate otp
  }
}
