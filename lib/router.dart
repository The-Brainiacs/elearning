import 'package:elearning_app/ui/views/calendar.dart';
import 'package:elearning_app/ui/models/message_data.dart';
import 'package:elearning_app/ui/views/messages.dart';
import 'package:elearning_app/ui/views/notifications.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/login_page.dart';
import 'package:elearning_app/ui/views/profile.dart';
import 'package:elearning_app/ui/views/settings.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case 'notifications':
        return MaterialPageRoute(builder: (_) => NotificationsPage());
      case 'calendar':
        return MaterialPageRoute(builder: (_) => CalendarPage());
      case 'messages':
        return MaterialPageRoute(builder: (_) => MessagesPage(mockData));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
