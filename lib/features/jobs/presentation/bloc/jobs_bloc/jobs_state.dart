part of 'jobs_bloc.dart';

sealed class JobsState extends Equatable {
  final List<Job> jobs;
  const JobsState({required this.jobs});

  @override
  List<Object> get props => [jobs];
}

final class JobsInitial extends JobsState {
  const JobsInitial({super.jobs = const []});
}

final class JobsLoadingState extends JobsState {
  const JobsLoadingState({required super.jobs});
}

final class JobsLoadedState extends JobsState {
  const JobsLoadedState({required super.jobs});
}

final class JobsNoInternetConnectionState extends JobsState {
  const JobsNoInternetConnectionState({required super.jobs});
}

final class JobsErrorState extends JobsState {
  final String message;
  const JobsErrorState({
    required this.message,
    required super.jobs,
  });

  @override
  List<Object> get props => [message, jobs];
}
