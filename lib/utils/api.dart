class Api {
  static final baseUrl = "https://class-management.azurewebsites.net/api/";
  static _StudentApi studentApi = _StudentApi();
  static _GradeApi gradeApi = _GradeApi();
}

class _StudentApi {
  final String login = "student/login/";
  final String me = "student/me/";
  final String classrooms = "student/classrooms/";
}

class _GradeApi {
  final String gradestu = "student/mark/";
}
