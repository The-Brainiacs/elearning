import 'package:elearning_app/core/services/rest_services.dart';
import 'package:elearning_app/ui/models/calendar_model.dart';
import 'package:http/http.dart' as http;

class CalendarService {
  static final CalendarService _instance = CalendarService._constructor();
  factory CalendarService() {
    return _instance;
  }
  CalendarService._constructor();
  final rest = RestService();

  static const String baseUrl = 'http://localhost:3000/calendar';

  Future<List<Calendar>> displayEvent() async {
    final listJson = await rest.get('calendar');

    return (listJson as List)
        .map((itemJson) => Calendar.fromJson(itemJson))
        .toList();
  }

  Future<Calendar> createEvent(String date, String event) async {
    final response =
        await http.post(baseUrl, body: {"date": date, "event": event});
    if (response.statusCode == 201) {
      final String responseString = response.body;
      return calendarFromJson(responseString);
    } else {
      return null;
    }
  }
}
