import 'package:dartz/dartz.dart';
import '../../../../core/usecases/params/no_params.dart';
import '../models/job_model.dart';
import '../../domain/usecases/fetch_job_details.dart';
import '../../domain/repositories/jobs_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/repositories/repository_handler.dart';
import '../datasources/jobs_remote_data_source.dart';

class JobsRepositoryImpl implements JobsRepository {
  final JobsRemoteDataSource jobsRemoteDataSource;
  final NetworkInfo networkInfo;
  final RepositoryHandler repositoryHandler;

  JobsRepositoryImpl({
    required this.jobsRemoteDataSource,
    required this.networkInfo,
    required this.repositoryHandler,
  });

  @override
  Future<Either<Failure, List<JobModel>>> fetchJobs(NoParams params) async {
    if (await networkInfo.isConnected) {
      return repositoryHandler.handle<List<JobModel>>(
        () async {
          final jobs = await jobsRemoteDataSource.fetchJobs(params);
          return jobs;
        },
      );
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, JobModel>> fetchJobDetails(
      JobDetailsParams params) async {
    if (await networkInfo.isConnected) {
      return repositoryHandler.handle<JobModel>(
        () async {
          final job = await jobsRemoteDataSource.fetchJobDetails(params);
          return job;
        },
      );
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
