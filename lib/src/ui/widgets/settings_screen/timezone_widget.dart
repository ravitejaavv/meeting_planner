import 'package:meeting_planner_app/src/ui/screens/timezone_list_screen.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

import '../../utils/sharedpreference_helper.dart';

class TimeZoneWidget extends StatefulWidgetBase {
  @override
  _TimeZoneWidgetState createState() => _TimeZoneWidgetState();
}

class _TimeZoneWidgetState extends State<TimeZoneWidget> {
  String timeZoneName;

  @override
  void initState() {
    _setupTimezone();
    super.initState();
  }

  _setupTimezone() {
    setState(() {
      timeZoneName = "(" + prefsHelper.getTimeZone() + ")";
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(TimeZoneScreen.ROUTE_NAME,
            arguments: TimeZoneScreenArguments(() {
          _setupTimezone();
        }));
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 12.0),
          child: Row(
            children: [
              Text(S.of(context).timezone,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.black54)),
              SizedBox(
                width: 5,
              ),
              Text(timeZoneName,
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
          )),
    );
  }
}
