import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/usecases/params/no_params.dart';
import '../../../domain/entities/job.dart';
import '../../../domain/usecases/fetch_jobs.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final FetchJobs fetchJobs;

  JobsBloc({required this.fetchJobs}) : super(const JobsInitial()) {
    on<FetchJobsEv>(_onFetchJobsEvent);
  }

  FutureOr<void> _onFetchJobsEvent(
      FetchJobsEv event, Emitter<JobsState> emit) async {
    emit(JobsLoadingState(jobs: state.jobs));
    final failureOrJobs = await fetchJobs(NoParams());
    emit(failureOrJobs.fold(
      (failure) => _mapFailureToState(failure),
      (jobs) => JobsLoadedState(jobs: jobs),
    ));
  }

  JobsState _mapFailureToState(Failure failure) {
    if (failure is MessageFailure) {
      return JobsErrorState(message: (failure).message, jobs: state.jobs);
    } else if (failure is NoInternetConnectionFailure) {
      return JobsNoInternetConnectionState(
        jobs: state.jobs,
      );
    } else {
      return JobsErrorState(
        message: AppStrings.someThingWentWrong,
        jobs: state.jobs,
      );
    }
  }
}
