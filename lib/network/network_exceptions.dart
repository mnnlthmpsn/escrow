class CustomException implements Exception {
  final _message;

  CustomException([this._message]);

  @override
  String toString() {
    // return "$_prefix$_message";
    return "$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message = "Error During Communication"])
      : super(message);
}

class BadRequestException extends CustomException {
  BadRequestException([String? message = "Invalid Request"]) : super(message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message = "Unauthorised"]) : super(message);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message = "Invalid Input"]) : super(message);
}
