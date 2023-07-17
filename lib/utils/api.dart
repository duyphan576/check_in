class Api {
  static final baseUrl = "https://class-management.azurewebsites.net/api/";
  static _StudentApi studentApi = _StudentApi();
}

class _StudentApi {
  final String login = "student/login/";
  final String classrooms = "student/classrooms/";
}
