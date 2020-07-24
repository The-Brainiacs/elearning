import './rest_service.dart';
import '../ui/models/student.dart';
import '../ui/shared/dashboard_data.dart';

// QuoteDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class StudentDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final StudentDataService _instance = StudentDataService._constructor();
  factory StudentDataService() {
    return _instance;
  }

  StudentDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

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
    // final json = await rest.patch('students', data: {
      'email': email,
      'phone': phone,
    });
    return Student.fromJson(json);
  }

  // You may not need this REST call in your app. It is only for example here.
  // Future<Student> createStudent({Student student}) async {
  //   final json = await rest.post('students', data: student);
  //   return Student.fromJson(json);
  // }

  // Future<Quote> updateVote({String id, Quote quote, bool liked}) async {
  //   quote = updateVoteNum(quote: quote, liked: liked);
  //   final json = await rest.patch('quotes/$id',
  //        data: liked ? {'like': quote.like} : {'dislike': quote.dislike});
  //   return Quote.fromJson(json);
  // }

  // Quote updateVoteNum({Quote quote, bool liked}) {
  //   if(liked){
  //     ++quote.like;
  //   }
  //   else{
  //     ++quote.dislike;
  //   }
  //   return quote;
  // }

}
