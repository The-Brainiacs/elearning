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

  static const String baseUrl =
      'https://us-central1-elearning-910d5.cloudfunctions.net/api';

  Future<List<Calendar>> displayEvent() async {
    final listJson = await rest.get('calendar');

    return (listJson as List)
        .map((itemJson) => Calendar.fromJson(itemJson))
        .toList();
  }

  Future<Calendar> createEvent({Calendar calendar}) async {
    final json = await rest.post('calendar', data: calendar);
    return Calendar.fromJson(json);
  }
}

final dataService = CalendarService();
