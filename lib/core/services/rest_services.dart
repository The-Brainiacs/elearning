import 'dart:convert';
import 'package:http/http.dart' as http;

// RestService is a wrapper class implmenting for REST API calls.
//  The class is implemented using the Singleton design pattern.
//  i.e. this class will only be instantiated once

class RestService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------
  static final RestService _instance = RestService._constructor();
  factory RestService() {
    return _instance;
  }

  RestService._constructor();
  //---------------------------- end of singleton implementation

  static const String baseUrl =
      'https://us-central1-elearning-910d5.cloudfunctions.net/api';

  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }
}
