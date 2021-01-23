import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:meeting_planner_app/src/controllers/blocs/base_bloc.dart';
import 'package:meeting_planner_app/src/controllers/blocs/home/home_bloc.dart';
import 'package:meeting_planner_app/src/models/booking_model.dart';
import 'package:meeting_planner_app/src/models/ui_models/office_hours_model.dart';
import 'package:meeting_planner_app/src/models/ui_models/room_model.dart';
import 'package:meeting_planner_app/src/ui/screens/booking_screen.dart';
import 'package:meeting_planner_app/src/ui/screens/settings_screen.dart';
import 'package:meeting_planner_app/src/ui/utils/common_util.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/common_widget.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';
import 'package:meeting_planner_app/src/ui/widgets/home_screen/action_widgets.dart';
import 'package:meeting_planner_app/src/ui/widgets/home_screen/meetings_list_widgets.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return MeetingPlannerBlocProvider(
        child: HomeScreenWidget(), bloc: HomeBloc());
  }
}

class HomeScreenWidget extends StatefulWidgetBase {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenWidget> with CommonWidget {
  HomeBloc homeBloc;
  DateTime selectedDateTime, maxDateTime, minDateTime;
  bool isToday;

  @override
  void initState() {
    homeBloc = MeetingPlannerBlocProvider.of<HomeBloc>(context);
    _setupInitialData();
    selectedDateTime = DateTime.now();
    maxDateTime = DateTime(selectedDateTime.year, selectedDateTime.month,
        selectedDateTime.day + 30);
    minDateTime = DateTime(selectedDateTime.year, selectedDateTime.month - 3,
        selectedDateTime.day);
    _getAllBookings(dateTime: selectedDateTime);
    super.initState();
  }

  _setupInitialData() {
    String meetingRoomDetails = prefsHelper.getMeetigRoomDetails();
    if (meetingRoomDetails == null) {
      List<RoomItem> rooms = [
        RoomItem(1, ColorConstants.roomA, "A"),
        RoomItem(2, ColorConstants.roomB, "B"),
        RoomItem(3, ColorConstants.roomC, "C"),
        RoomItem(4, ColorConstants.roomD, "D")
      ];
      String data = json.encode(MeetingRooms(meetingRooms: rooms));
      prefsHelper.setMeetigRoomDetails(data);

      DateTime currentTime = DateTime.now();
      DateTime officeStartTime = DateTime(currentTime.year, currentTime.month, currentTime.day, 9, 0);
      DateTime officeClosingTime = DateTime(currentTime.year, currentTime.month, currentTime.day, 17, 0);
      OfficeHours officeHours = OfficeHours();
      officeHours.startTime = officeStartTime.toIso8601String();
      officeHours.closingTime = officeClosingTime.toIso8601String();

      String officeHoursData = json.encode(officeHours);
      prefsHelper.setOfficeHours(officeHoursData);
    }
  }

  _getAllBookings({DateTime dateTime}) {
    homeBloc.getAllBookings(dateTime: dateTime).then((data) {
      homeBloc.changesSelectedDateTime(selectedDateTime);
      homeBloc.changesBookings(data);
    });
  }

  Future<bool> _willPopScope() {
    return SystemNavigator.pop(animated: false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        appBar: getAppBar(context, S.of(context).meetings_title,
            backActionRequired: false,
            isActionRequired: true,
            isCenterTitle: false, actionWidget: ActionWidgets((actionType) {
          switch (actionType) {
            case ActionType.calender:
              _datePicker();
              break;
            case ActionType.settings:
              Navigator.of(context).pushNamed(SettingsScreen.ROUTE_NAME,
                  arguments: SettingsScreenArguments(() {
                homeBloc.changesBookings(homeBloc.bookingsList);
              }));
              break;
          }
        })),
        body: MeetingsListWidget(homeBloc, _onItemClick),
        drawer: Drawer(
          child: Container(
              child: Center(
                  child: Text(
            "Coming Soon",
            style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ))),
        ),
        floatingActionButton: !CommonUtil.instance.isPast(selectedDateTime) ? FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: ColorConstants.primaryColor,
          onPressed: () {
            _onItemClick(null);
          },
        ) : null,
      ),
    );
  }

  _onItemClick(BookingItem bookingItem) {
    Navigator.of(context).pushNamed(BookingScreen.ROUTE_NAME,
        arguments: BookingScreenArguments(() {
          _getAllBookings(dateTime: selectedDateTime);
        }, homeBloc, bookingItem));
  }

  _datePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: minDateTime,
        maxTime: maxDateTime,
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        selectedDateTime = date;
      });
      _getAllBookings(dateTime: date);
    }, currentTime: selectedDateTime, locale: LocaleType.en);
  }
}
