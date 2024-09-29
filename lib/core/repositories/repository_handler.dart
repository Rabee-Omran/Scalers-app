import 'dart:async';
import 'package:dartz/dartz.dart';
import '../resources/strings_manager.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

abstract class RepositoryHandler {
  Future<Either<Failure, T>> handle<T>(Future<T> Function() onHandle);
}

class RepositoryHandlerImpl implements RepositoryHandler {
  @override
  Future<Either<Failure, T>> handle<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(
          message: e.message ??AppStrings.someThingWentWrong));
    } on ServerException {
      return Left(ServerFailure());
    } on NoInternetConnectionException {
      return Left(NoInternetConnectionFailure());
    }
  }
}
