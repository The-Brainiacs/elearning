import 'package:elearning_app/ui/views/notifications.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/login_page.dart';
import 'package:elearning_app/ui/views/profile.dart';
import 'package:elearning_app/ui/views/settings.dart';
import 'package:elearning_app/ui/shared/dashboard_data.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfilePage(mockDataDashboard)); 
      case 'notifications':
        return MaterialPageRoute(builder: (_) => NotificationsPage());     
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