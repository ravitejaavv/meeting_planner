import 'package:meeting_planner_app/src/ui/utils/logger.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimeZoneWidget extends StatefulWidgetBase {
  @override
  _TimeZoneWidgetState createState() => _TimeZoneWidgetState();
}

class _TimeZoneWidgetState extends State<TimeZoneWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        tz.timeZoneDatabase.locations.forEach((key, value) {
          MyLogger.print("key "+key + "    " + "value "+ value.toString());
        });
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
}
