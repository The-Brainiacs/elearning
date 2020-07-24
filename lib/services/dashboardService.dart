// import 'dart:convert';

// import '../core/services/rest_services.dart';
import './rest_service.dart';

// import '../ui/models/student.dart';
// import '../core/services/rest_services.dart';
import '../ui/models/dashboard_data.dart';

// QuoteDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class DataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final DataService _instance = DataService._constructor();
  factory DataService() {
    return _instance;
  }

  DataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

  Future<List<Course>> getAllCourses() async {
    final listJson = await rest.get('courses');

    // final courseID = json['assessments'][i]['memberId'];
    // json['assignment'] = await get('assignment?courseId=$id');

    // for (int i = 0; i < listJson['courses'].length; i++) {
    //   final courseId = listJson['courses'][i]['courseId'];
    //   listJson['assignment'] = await rest.get('assignment?courseId=$courseId');
    // }

    return (listJson as List)
        .map((itemJson) => Course.fromJson(itemJson))
        .toList();
  }

  Future<Assignment> updateAssignmentStatus({int id, bool status}) async {
    final json = await rest.patch('assignment/$id', data: {'status': status});

    return Assignment.fromJson(json);
  }

  Future<Course> getCourse(int id) async {
    // final json = await rest.get('students/$id');
    final json = await rest.get('courses/$id');

    return Course.fromJson(json);
  }

  Future<Course> updateAssignment(
      {String id, List<Assignment> assignment}) async {
    // Future<Student> updateStudent({String id, Student student}) async {
    // final json = await rest.patch('students/$id', data: {
    // String ljson = jsonEncode(assignment);
    final json = await rest.patch('courses/$id', data: {
      'assignment': assignment,
    });
    return Course.fromJson(json);
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
