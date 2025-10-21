class EndPoints {
  static const String baseUrl =
      'https://68f6b896f7fb897c661366d7.mockapi.io/api/v1/';

  static const String login = 'auth';

  static const String jobs = 'job';

  static String jobDetails(String id) => 'job/$id';

  static String updateJobStatus(String id) => 'job/$id';
}
