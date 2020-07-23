import 'package:elearning_app/core/services/rest_services.dart';
import 'package:elearning_app/ui/models/calendar_model.dart';
// import 'package:http/http.dart' as http;

class CalendarService {
  static final CalendarService _instance = CalendarService._constructor();
  factory CalendarService() {
    return _instance;
  }
  CalendarService._constructor();
  final rest = RestService();

  static const String baseUrl = 'http://192.168.0.111:3000';

  Future<List<Calendar>> displayEvent() async {
    final listJson = await rest.get('calendar');

    return (listJson as List)
        .map((itemJson) => Calendar.fromJson(itemJson))
        .toList();
  }

  Future<Calendar> createEvent(
      String id, String date, String description) async {
    final response = await rest.post('calendar', data: {
      'id': id,
      'date': date,
      'description': description,
    });
    if (response.statusCode == 201) {
      final String responseString = response.body;
      return calendarFromJson(responseString);
    } else {
      return null;
    }
  }
}
