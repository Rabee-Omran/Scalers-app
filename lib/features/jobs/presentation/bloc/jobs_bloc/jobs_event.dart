part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class FetchJobsEv extends JobsEvent {}
