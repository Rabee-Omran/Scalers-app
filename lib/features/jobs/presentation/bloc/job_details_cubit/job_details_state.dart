part of 'job_details_cubit.dart';

sealed class JobDetailsState extends Equatable {
  const JobDetailsState();

  @override
  List<Object> get props => [];
}

final class JobDetailsInitial extends JobDetailsState {}

final class JobDetailsLoadingState extends JobDetailsState {}

final class JobDetailsLoadedState extends JobDetailsState {
  final Job job;
  const JobDetailsLoadedState({required this.job});
}

final class JobDetailsNoInternetConnectionState extends JobDetailsState {}

final class JobDetailsErrorState extends JobDetailsState {
  final String message;
  const JobDetailsErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
