import 'package:dartz/dartz.dart';
import '../../../../core/usecases/params/no_params.dart';
import '../entities/job.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/jobs_repository.dart';

class FetchJobs implements UseCase<List<Job>, NoParams> {
  final JobsRepository jobsRepository;

  FetchJobs({required this.jobsRepository});
  @override
  Future<Either<Failure, List<Job>>> call(NoParams params) {
    return jobsRepository.fetchJobs(params);
  }
}
