import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          error.response?.statusCode,
          error.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer is cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with ApiServer');
      case DioExceptionType.unknown:
        if (error.message != null &&
            error.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, please try again!');
        }
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request is not found, please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, please try later!');
    } else {
      return ServerFailure('Opps There was an error, please try again!');
    }
  }
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure(super.message);
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);
}
