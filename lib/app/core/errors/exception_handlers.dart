import 'package:dio/dio.dart';

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnprocessableEntity extends DioException {
  UnprocessableEntity(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    if (response != null) {
      return response!.data['errors'].first['message'];
    }

    return 'Validation failed';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class BadCertificateException implements Exception {
  final RequestOptions requestOptions;

  BadCertificateException(this.requestOptions);

  @override
  String toString() {
    return 'BadCertificateException: Certificado inválido ao acessar ${requestOptions.uri}';
  }
}

class DioErrorException implements Exception {
  final RequestOptions requestOptions;
  final DioExceptionType exceptionType;

  DioErrorException(this.requestOptions, this.exceptionType);

  @override
  String toString() {
    return 'DioErrorException: Exceção do tipo ${exceptionType.toString()} ao acessar ${requestOptions.uri}';
  }
}
