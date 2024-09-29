class EndPoints {
  static const String baseUrl =
      'https://mpa0771a40ef48fcdfb7.free.beeceptor.com/';

  static const String jobs = '/jobs';
  static String jobDetails(String jobUuid) => '/jobs/$jobUuid';
}
