class Api {
  static final baseUrl = "https://class-management.azurewebsites.net/api/";
  static _StudentApi studentApi = _StudentApi();
  static _LoginApi loginApi = _LoginApi();
}

class _StudentApi {
  final String students = "students/";
}

class _LoginApi {
  final String login = "login/student/";
  final String me = "me/";
}
