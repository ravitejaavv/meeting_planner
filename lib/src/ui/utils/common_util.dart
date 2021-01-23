import 'dart:core';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:meeting_planner_app/src/models/ui_models/room_model.dart';
import 'dart:convert';

import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';

class CommonUtil {
  static CommonUtil instance = CommonUtil();

  convertTo_yyyy_MM_dd(DateTime dateTime) {
    try {
      return DateFormat("yyyy-MM-dd").format(dateTime);
    } catch (e) {
      return "";
    }
  }

  convertTo_dd_MMM_yyyy(DateTime dateTime) {
    try {
      return DateFormat("dd MMM yyyy").format(dateTime);
    } catch (e) {
      return "";
    }
  }

  convertTo_dd_MM_yyyy(DateTime dateTime) {
    try {
      return DateFormat("dd/MM/yyyy").format(dateTime);
    } catch (e) {
      return "";
    }
  }

  convertTo_ddMMyyyy(DateTime dateTime) {
    try {
      return DateFormat("dd-MM-yyyy").format(dateTime);
    } catch (e) {
      return "";
    }
  }

  convertTo_dd_MMM_yyyy_hhmm(DateTime dateTime) {
    try {
      return DateFormat("dd, MMM yyyy hh:mm a").format(dateTime);
    } catch (e) {
      return "";
    }
  }

  convertTo_hhmm(DateTime dateTime) {
    try {
      return DateFormat("hh:mm a").format(dateTime);
    } catch (e) {
      return "";
    }
  }

  convertTo_DateTime(String date) {
    try {
      return DateTime.parse(date);
    } catch (e) {
      return null;
    }
  }

  getDurationInMinutes(String selectedDuration){
    switch(selectedDuration){
      case '30 minutes': return 30;
      case '45 minutes': return 45;
      case '1 hour': return 60;
      case '1 hour 30 minutes': return 90;
      case '24 hours': return (24*60);
    }
  }

  getDurationString(int duration){
    switch(duration){
      case 30: return '30 minutes';
      case 45: return '45 minutes';
      case 60: return '1 hour';
      case 90: return '1 hour 30 minutes';
      case 24*60: return '24 hours';
    }
  }

  bool isPast(DateTime selectedDateTime){
    DateTime currentDateTime = DateTime.now();
    return (selectedDateTime.year < currentDateTime.year || selectedDateTime.month < currentDateTime.month || selectedDateTime.day < currentDateTime.day);
  }
}
