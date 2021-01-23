import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meeting_planner_app/meeting_planner_app.dart';
import 'package:meeting_planner_app/src/ui/resources/color_constants.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'src/ui/widgets/common/common_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorConstants.primaryColor, // status bar color
    statusBarBrightness: Brightness.light, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
  ));
  await SharedPrefsHelper().initialize();
  tz.initializeTimeZones();
  CommonWidget.initializePlatformSpecifics();
  runApp(MeetingPlannerApp());
}