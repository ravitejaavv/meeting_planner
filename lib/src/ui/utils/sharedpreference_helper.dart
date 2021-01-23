import 'package:meeting_planner_app/src/ui/utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPrefsHelper prefsHelper = SharedPrefsHelper();

class SharedPrefsHelper {
  static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();

  factory SharedPrefsHelper() {
    return _instance;
  }

  SharedPrefsHelper._internal();

  SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return 0;
  }

  String getOfficeHours() {
    return _prefs.getString(StringConstants.OFFICE_HOURS);
  }

  setOfficeHours(String officeHours) {
    _prefs.setString(StringConstants.OFFICE_HOURS, officeHours);
  }

  String getTimeZone() {
    return _prefs.getString(StringConstants.TIMEZONE);
  }

  setTimeZone(String timezone) {
    _prefs.setString(StringConstants.TIMEZONE, timezone);
  }

  String getMeetigRoomDetails() {
    return _prefs.getString(StringConstants.MEETING_ROOM_COLOR_CODES);
  }

  setMeetigRoomDetails(String meetingRoomDetails) {
    _prefs.setString(StringConstants.MEETING_ROOM_COLOR_CODES, meetingRoomDetails);
  }

  bool getNotificationStatus() {
    bool status = _prefs.getBool(StringConstants.NOTIFICATION_ON_OFF);
    return status == null ? true : status;
  }

  setNotificationStatus(bool isOn) {
    _prefs.setBool(StringConstants.NOTIFICATION_ON_OFF, isOn);
  }

  clearData() {
    _prefs.clear();
  }
}
