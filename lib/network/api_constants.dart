import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String kBaseUrl = dotenv.get('API_BASE_URL');
  static String kResendOTP = "resend_otp";
  static String kValidateOTP = "validate_otp";
  static String kRequestLogin = "login";
  static String kRequestSignUp = "signup";
}