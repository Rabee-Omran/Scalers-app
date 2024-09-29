import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/fetch_job_details.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../domain/entities/job.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final FetchJobDetails fetchJobDetailsUsecase;
  JobDetailsCubit({required this.fetchJobDetailsUsecase})
      : super(JobDetailsInitial());

  void fetchJobDetails(JobDetailsParams params) async {
    emit(JobDetailsLoadingState());
    final failureOrJobDetails = await fetchJobDetailsUsecase(params);
    emit(failureOrJobDetails.fold(
      (failure) => _mapFailureToState(failure),
      (job) => JobDetailsLoadedState(job: job),
    ));
  }

  JobDetailsState _mapFailureToState(Failure failure) {
    if (failure is MessageFailure) {
      return JobDetailsErrorState(message: (failure).message);
    } else if (failure is NoInternetConnectionFailure) {
      return JobDetailsNoInternetConnectionState();
    } else {
      return const JobDetailsErrorState(
        message: AppStrings.someThingWentWrong,
      );
    }
  }
}
