import 'package:dartz/dartz.dart';
import '../entities/job.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/jobs_repository.dart';

class FetchJobDetails implements UseCase<Job, JobDetailsParams> {
  final JobsRepository jobsRepository;

  FetchJobDetails({required this.jobsRepository});
  @override
  Future<Either<Failure, Job>> call(JobDetailsParams params) {
    return jobsRepository.fetchJobDetails(params);
  }
}

class JobDetailsParams {
  final String uuid;

  JobDetailsParams({
    required this.uuid,
  });
}
