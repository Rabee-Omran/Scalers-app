import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/jobs/domain/usecases/fetch_job_details.dart';
import 'features/jobs/domain/usecases/fetch_jobs.dart';
import 'features/jobs/presentation/bloc/job_details_cubit/job_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/locale/localization_cubit/localization_cubit.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'core/repositories/repository_handler.dart';
import 'core/utils/shared_pref.dart';
import 'features/jobs/data/datasources/jobs_remote_data_source.dart';
import 'features/jobs/data/repositories/jobs_repository_impl.dart';
import 'features/jobs/domain/repositories/jobs_repository.dart';
import 'features/jobs/presentation/bloc/jobs_bloc/jobs_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initJobs();
  await _registerCoreAndExternal();
}

//! Features
//Jobs
void _initJobs() {
  //bloc
  sl.registerFactory(() => JobsBloc(fetchJobs: sl()));
  sl.registerFactory(() => JobDetailsCubit(fetchJobDetailsUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => FetchJobDetails(jobsRepository: sl()));
  sl.registerLazySingleton(() => FetchJobs(jobsRepository: sl()));

  //repositories
  sl.registerLazySingleton<JobsRepository>(() => JobsRepositoryImpl(
      jobsRemoteDataSource: sl(), repositoryHandler: sl(), networkInfo: sl()));

  //data sources
  sl.registerLazySingleton<JobsRemoteDataSource>(
      () => JobsRemoteDataSourceImpl(apiConsumer: sl()));
}

Future<void> _registerCoreAndExternal() async {
  //! Core
  sl.registerFactory(() => LocalizationCubit(sharedPref: sl()));
  sl.registerLazySingleton(() => SharedPref(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<RepositoryHandler>(() => RepositoryHandlerImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppIntercepters(client: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
