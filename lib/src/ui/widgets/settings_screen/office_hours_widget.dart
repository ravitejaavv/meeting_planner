import 'dart:convert';

import 'package:meeting_planner_app/src/models/ui_models/office_hours_model.dart';
import 'package:meeting_planner_app/src/ui/screens/office_hours_screen.dart';
import 'package:meeting_planner_app/src/ui/utils/common_util.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class OfficeHoursWidget extends StatefulWidgetBase {
  @override
  _OfficeHoursWidgetState createState() => _OfficeHoursWidgetState();
}

class _OfficeHoursWidgetState extends State<OfficeHoursWidget> {
  OfficeHours officeHours;
  String officeHoursString = "";

  @override
  void initState() {
    setOfficeHours();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(OfficeHoursScreen.ROUTE_NAME, arguments: OfficeHoursScreenArguments((){
          setOfficeHours();
        }, officeHours));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 12.0),
        child: Row(
          children: [
            Text(S.of(context).office_hours,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Colors.black54)),
            SizedBox(
              width: 5,
            ),
            Text(officeHoursString,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: ColorConstants.primaryColor)),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black38,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  setOfficeHours(){
    String officeHoursData = prefsHelper.getOfficeHours();
    officeHours =
        OfficeHours.fromJson(json.decode(officeHoursData));
    String startTimeString = CommonUtil.instance.convertTo_hhmm(DateTime.parse(officeHours.startTime));
    String closingTimeString = CommonUtil.instance.convertTo_hhmm(DateTime.parse(officeHours.closingTime));
    setState(() {
      officeHoursString = "(" + startTimeString + " - " + closingTimeString + ")";
    });
  }
}
