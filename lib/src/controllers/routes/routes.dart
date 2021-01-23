import 'package:flutter/material.dart';
import 'package:meeting_planner_app/src/ui/screens/home_screen.dart';
import 'package:meeting_planner_app/src/ui/screens/booking_screen.dart';
import 'package:meeting_planner_app/src/ui/screens/office_hours_screen.dart';
import 'package:meeting_planner_app/src/ui/screens/settings_screen.dart';
import 'package:meeting_planner_app/src/ui/screens/timezone_list_screen.dart';
import 'package:meeting_planner_app/src/ui/utils/logger.dart';
import 'custom_material_page_route.dart';

class Routes {
  static onGenerateRoute(RouteSettings settings) {
    MyLogger.print('ROUTE: ' + settings.name);
    switch (settings.name) {
      case HomeScreen.ROUTE_NAME:
        return _navigate(HomeScreen(), settings);
      case BookingScreen.ROUTE_NAME:
        return _navigate(BookingScreen(settings.arguments), settings);
      case SettingsScreen.ROUTE_NAME:
        return _navigate(SettingsScreen(settings.arguments), settings);
      case OfficeHoursScreen.ROUTE_NAME:
        return _navigate(OfficeHoursScreen(settings.arguments), settings);
      case TimeZoneScreen.ROUTE_NAME:
        return _navigate(TimeZoneScreen(settings.arguments), settings);
    }
    return null;
  }
}

_navigate(Widget child, RouteSettings settings) {
  return CustomMaterialPageRoute(
      settings: settings,
      builder: (context) {
        return child;
      });
}
