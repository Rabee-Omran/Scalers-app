import '../../../../core/usecases/params/no_params.dart';
import '../../domain/usecases/fetch_job_details.dart';
import '../models/job_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';

abstract class JobsRemoteDataSource {
  Future<List<JobModel>> fetchJobs(NoParams params);
  Future<JobModel> fetchJobDetails(JobDetailsParams params);
}

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  final ApiConsumer apiConsumer;
  JobsRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<List<JobModel>> fetchJobs(NoParams params) async {
    final response = await apiConsumer.get(EndPoints.jobs);
    if (response.statusCode == 200) {
      final List<JobModel> jobs = (response.data['data'] as List)
          .map((jsonJob) => JobModel.fromJson(jsonJob['job']))
          .toList();

      return jobs;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<JobModel> fetchJobDetails(JobDetailsParams params) async {
    final response = await apiConsumer.get(
      EndPoints.jobDetails(params.uuid),
    );
    if (response.statusCode == 200) {
      return JobModel.fromJson(response.data['data']);
    } else {
      throw const ServerException();
    }
  }
}
