//
//  app_excaptions.dart
//  Exception Handler
//
//  Created by Eyüp Furkan Tüylü on 26.06.2023.
//

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? messge])
      : super(messge, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? messge]) : super(messge, 'Invalid Request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? messge])
      : super(messge, 'Unauthorised Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? messge]) : super(messge, 'Invalid Input');
}
