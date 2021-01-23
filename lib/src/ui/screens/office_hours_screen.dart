import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:meeting_planner_app/src/models/ui_models/office_hours_model.dart';
import 'package:meeting_planner_app/src/ui/utils/common_util.dart';
import 'package:meeting_planner_app/src/ui/utils/logger.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/common_widget.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';
import 'package:toast/toast.dart';

class OfficeHoursScreen extends StatefulWidgetBase {
  static const ROUTE_NAME = "/home/settings/office_hours_screen";

  OfficeHoursScreenArguments arguments;

  OfficeHoursScreen(this.arguments);

  @override
  _OfficeHoursScreenState createState() => _OfficeHoursScreenState();
}

class _OfficeHoursScreenState extends State<OfficeHoursScreen>
    with CommonWidget {
  DateTime startTime, closingTime;
  String startTimeString, closingTimeString;
  OfficeHours officeHours;

  @override
  void initState() {
    officeHours = widget.arguments.officeHours;
    startTime = DateTime.parse(officeHours.startTime);
    closingTime = DateTime.parse(officeHours.closingTime);
    startTimeString = CommonUtil.instance.convertTo_hhmm(startTime);
    closingTimeString = CommonUtil.instance.convertTo_hhmm(closingTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, S.of(context).settings_title),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).start_time,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.black38),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      startTimeString,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0,
                          color: ColorConstants.primaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        _datePicker(startTime, true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).end_time,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.black38),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      closingTimeString,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0,
                          color: ColorConstants.primaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        _datePicker(closingTime, false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    int hours = closingTime.difference(startTime).inHours;
                    if(hours < 8) {
                      Toast.show(S
                          .of(context)
                          .office_hours_8, context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }else {
                      officeHours.startTime = startTime.toIso8601String();
                      officeHours.closingTime = closingTime.toIso8601String();
                      String officeHoursData = json.encode(officeHours);
                      prefsHelper.setOfficeHours(officeHoursData);
                      widget.arguments.onUpdate();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    S.of(context).update_title,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: ColorConstants.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _datePicker(DateTime currentTime, bool isStartTime) {
    DatePicker.showTime12hPicker(context,
        showTitleActions: true,
        currentTime: currentTime,
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        if (isStartTime) {
          if (!date.isBefore(closingTime)) {
            Toast.show(S.of(context).start_time_more_closing_time, context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          } else {
            startTime = date;
            startTimeString = CommonUtil.instance.convertTo_hhmm(startTime);
          }
        } else {
          if (!date.isAfter(startTime)) {
            Toast.show(S.of(context).end_time_more_start_time, context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          } else {
            closingTime = date;
            closingTimeString = CommonUtil.instance.convertTo_hhmm(closingTime);
          }
        }
      });
    }, locale: LocaleType.en);
  }
}

class OfficeHoursScreenArguments {
  Function() onUpdate;
  OfficeHours officeHours;

  OfficeHoursScreenArguments(this.onUpdate, this.officeHours);
}
