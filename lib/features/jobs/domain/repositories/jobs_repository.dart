import 'package:dartz/dartz.dart';
import '../../../../core/usecases/params/no_params.dart';
import '../entities/job.dart';
import '../../../../core/error/failures.dart';
import '../usecases/fetch_job_details.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<Job>>> fetchJobs(NoParams params);
  Future<Either<Failure, Job>> fetchJobDetails(JobDetailsParams params);
}
