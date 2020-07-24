import './rest_service.dart';
import '../ui/models/student.dart';
import '../ui/shared/dashboard_data.dart';

// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class StudentDataService {

  static final StudentDataService _instance = StudentDataService._constructor();
  factory StudentDataService() {
    return _instance;
  }

  StudentDataService._constructor();
  final rest = RestService();

  Future<List<Student>> getAllStudent() async {
    final listJson = await rest.get('students');

    return (listJson as List)
        .map((itemJson) => Student.fromJson(itemJson))
        .toList();
  }

  Future<List<Course>> getAllCourses() async {
    final listJson = await rest.get('courses');

    return (listJson as List)
        .map((itemJson) => Course.fromJson(itemJson))
        .toList();
  }

  Future<Student> getStudent({String id}) async {
    final json = await rest.get('students/$id');
    // final json = await rest.get('students');

    return Student.fromJson(json);
  }

  Future<Student> updateStudent({String id, String email, String phone}) async {
  // Future<Student> updateStudent({String id, Student student}) async {
    final json = await rest.patch('students/$id', data: {
      'email': email,
      'phone': phone,
    });
    return Student.fromJson(json);
  }

}
