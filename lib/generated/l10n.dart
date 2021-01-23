// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bookings`
  String get bookings_title {
    return Intl.message(
      'Bookings',
      name: 'bookings_title',
      desc: '',
      args: [],
    );
  }

  /// `Book Meeting Room`
  String get book_meeting {
    return Intl.message(
      'Book Meeting Room',
      name: 'book_meeting',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book_title {
    return Intl.message(
      'Book',
      name: 'book_title',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Title`
  String get enter_title {
    return Intl.message(
      'Enter Title',
      name: 'enter_title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Enter Description (min 15 characters)`
  String get enter_description {
    return Intl.message(
      'Enter Description (min 15 characters)',
      name: 'enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Date & Time`
  String get meeting_time_date {
    return Intl.message(
      'Meeting Date & Time',
      name: 'meeting_time_date',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Duration`
  String get meeting_duration {
    return Intl.message(
      'Meeting Duration',
      name: 'meeting_duration',
      desc: '',
      args: [],
    );
  }

  /// `Choose Meeting Room`
  String get choose_meeting_room {
    return Intl.message(
      'Choose Meeting Room',
      name: 'choose_meeting_room',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Choose Meeting Priority`
  String get choose_priority {
    return Intl.message(
      'Choose Meeting Priority',
      name: 'choose_priority',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get priority_high {
    return Intl.message(
      'High',
      name: 'priority_high',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get priority_medium {
    return Intl.message(
      'Medium',
      name: 'priority_medium',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get priority_low {
    return Intl.message(
      'Low',
      name: 'priority_low',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Choose Meeting Room`
  String get choose_meeting {
    return Intl.message(
      'Choose Meeting Room',
      name: 'choose_meeting',
      desc: '',
      args: [],
    );
  }

  /// `Meeting date & time`
  String get choose_meeting_date_time {
    return Intl.message(
      'Meeting date & time',
      name: 'choose_meeting_date_time',
      desc: '',
      args: [],
    );
  }

  /// `Do you want reminder? `
  String get reminder_yes_no {
    return Intl.message(
      'Do you want reminder? ',
      name: 'reminder_yes_no',
      desc: '',
      args: [],
    );
  }

  /// `Select meeting date & time`
  String get select_meeting_date_time {
    return Intl.message(
      'Select meeting date & time',
      name: 'select_meeting_date_time',
      desc: '',
      args: [],
    );
  }

  /// `Select meeting room`
  String get select_meeting_room {
    return Intl.message(
      'Select meeting room',
      name: 'select_meeting_room',
      desc: '',
      args: [],
    );
  }

  /// `Choose meeting priority`
  String get choose_meeting_priority {
    return Intl.message(
      'Choose meeting priority',
      name: 'choose_meeting_priority',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Time: `
  String get meeting_time {
    return Intl.message(
      'Meeting Time: ',
      name: 'meeting_time',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Duration: `
  String get meeting_duration_ {
    return Intl.message(
      'Meeting Duration: ',
      name: 'meeting_duration_',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Booking`
  String get cancel_booking {
    return Intl.message(
      'Cancel Booking',
      name: 'cancel_booking',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Details`
  String get meeting_details {
    return Intl.message(
      'Meeting Details',
      name: 'meeting_details',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Room`
  String get meeting_room {
    return Intl.message(
      'Meeting Room',
      name: 'meeting_room',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancel_status {
    return Intl.message(
      'Cancelled',
      name: 'cancel_status',
      desc: '',
      args: [],
    );
  }

  /// `Booking Status: `
  String get booking_status {
    return Intl.message(
      'Booking Status: ',
      name: 'booking_status',
      desc: '',
      args: [],
    );
  }

  /// `Meetings`
  String get meetings_title {
    return Intl.message(
      'Meetings',
      name: 'meetings_title',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_title {
    return Intl.message(
      'Settings',
      name: 'settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications_title {
    return Intl.message(
      'Notifications',
      name: 'notifications_title',
      desc: '',
      args: [],
    );
  }

  /// `Meeting rooms colour code`
  String get meeting_rooms_color_code {
    return Intl.message(
      'Meeting rooms colour code',
      name: 'meeting_rooms_color_code',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update_title {
    return Intl.message(
      'Update',
      name: 'update_title',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the room to change color code`
  String get click_to_update {
    return Intl.message(
      'Tap on the room to change color code',
      name: 'click_to_update',
      desc: '',
      args: [],
    );
  }

  /// `Choose color`
  String get choose_color {
    return Intl.message(
      'Choose color',
      name: 'choose_color',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes_title {
    return Intl.message(
      'Yes',
      name: 'yes_title',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no_title {
    return Intl.message(
      'No',
      name: 'no_title',
      desc: '',
      args: [],
    );
  }

  /// `Office Hours`
  String get office_hours {
    return Intl.message(
      'Office Hours',
      name: 'office_hours',
      desc: '',
      args: [],
    );
  }

  /// `TimeZone`
  String get timezone {
    return Intl.message(
      'TimeZone',
      name: 'timezone',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get start_time {
    return Intl.message(
      'Start Time',
      name: 'start_time',
      desc: '',
      args: [],
    );
  }

  /// `Closing Time`
  String get end_time {
    return Intl.message(
      'Closing Time',
      name: 'end_time',
      desc: '',
      args: [],
    );
  }

  /// `Start time should be less than closing time`
  String get start_time_more_closing_time {
    return Intl.message(
      'Start time should be less than closing time',
      name: 'start_time_more_closing_time',
      desc: '',
      args: [],
    );
  }

  /// `Closing time should be more than Start time`
  String get end_time_more_start_time {
    return Intl.message(
      'Closing time should be more than Start time',
      name: 'end_time_more_start_time',
      desc: '',
      args: [],
    );
  }

  /// `Office hours should not be less than 8 hours`
  String get office_hours_8 {
    return Intl.message(
      'Office hours should not be less than 8 hours',
      name: 'office_hours_8',
      desc: '',
      args: [],
    );
  }

  /// `Title cannot be empty`
  String get title_empty_error {
    return Intl.message(
      'Title cannot be empty',
      name: 'title_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Title length should be 2 characters`
  String get title_invalid_error {
    return Intl.message(
      'Title length should be 2 characters',
      name: 'title_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Description cannot be empty`
  String get description_empty_error {
    return Intl.message(
      'Description cannot be empty',
      name: 'description_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Description length should be min 15 characters`
  String get description_invalid_error {
    return Intl.message(
      'Description length should be min 15 characters',
      name: 'description_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `No meetings available`
  String get no_meetings_available {
    return Intl.message(
      'No meetings available',
      name: 'no_meetings_available',
      desc: '',
      args: [],
    );
  }

  /// `Click + button to book meeting`
  String get add_meeting {
    return Intl.message(
      'Click + button to book meeting',
      name: 'add_meeting',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}