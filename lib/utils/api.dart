class Api {
  static final baseUrl = "https://class-management.azurewebsites.net/api/";
  static _StudentApi studentApi = _StudentApi();
  static _LoginApi loginApi = _LoginApi();
}

class _StudentApi {
  final String students = "student/";
}

class _LoginApi {
  final String login = "student/login/";
  final String me = "student/me/";
}
