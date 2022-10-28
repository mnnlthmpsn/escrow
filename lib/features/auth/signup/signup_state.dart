import 'package:equatable/equatable.dart';
import 'package:escrow/shared/shared_events/form_submission.dart';

class SignUpState extends Equatable {
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phone;
  final String idType;
  final String idNumber;
  final String sex;
  final String resAddress;
  final String gpsPost;
  final String region;
  final String town;
  final String picture;
  final String password;
  final String password2;
  final String authCode;
  final FormSubmissionStatus formStatus;

  // stepper
  final int selectedStep;
  final int nbSteps = 5;

  const SignUpState(
      {this.firstName = "",
      this.middleName = "",
      this.lastName = "",
      this.email = "",
      this.phone = "",
      this.idType = "",
      this.idNumber = "",
      this.sex = "",
      this.resAddress = "",
      this.gpsPost = "",
      this.region = "",
      this.town = "",
      this.picture = "",
      this.password = "",
      this.password2 = "",
      this.authCode = "",
      this.formStatus = const InitialFormStatus(),
      this.selectedStep = 0});

  SignUpState copyWith(
      {String? firstName,
      String? middleName,
      String? lastName,
      String? email,
      String? phone,
      String? idType,
      String? idNumber,
      String? sex,
      String? resAddress,
      String? gpsPost,
      String? region,
      String? town,
      String? password,
      String? password2,
      String? authCode,
      FormSubmissionStatus? formStatus,
      int? selectedStep}) {
    return SignUpState(
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        idType: idType ?? this.idType,
        idNumber: idNumber ?? this.idNumber,
        sex: sex ?? this.sex,
        resAddress: resAddress ?? this.resAddress,
        gpsPost: gpsPost ?? this.gpsPost,
        region: region ?? this.region,
        town: town ?? this.town,
        password: password ?? this.password,
        password2: password2 ?? this.password2,
        authCode: authCode ?? this.authCode,
        formStatus: formStatus ?? this.formStatus,
        selectedStep: selectedStep ?? this.selectedStep);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        middleName,
        email,
        phone,
        idType,
        idNumber,
        sex,
        resAddress,
        gpsPost,
        region,
        town,
        picture,
        password,
        password2,
        authCode,
      selectedStep,
        formStatus
      ];
}

enum StepDirection { forward, backward }
