import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class MessageFailure extends Failure {
  final String message;

  MessageFailure({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
