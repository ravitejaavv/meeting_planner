import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class NotificationSettingsWidget extends StatefulWidgetBase {
  @override
  _NotificationSettingsWidgetState createState() => _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState extends State<NotificationSettingsWidget> {

  bool isNotifications;

  @override
  void initState() {
    isNotifications = prefsHelper.getNotificationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).notifications_title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Colors.black54)),
        Expanded(
          child: SizedBox(
            width: 10,
          ),
        ),
        Switch(
          value: isNotifications,
          onChanged: (value) {
            prefsHelper.setNotificationStatus(value);
            setState(() {
              isNotifications = value;
            });
          },
          activeTrackColor: ColorConstants.primaryLightColor,
          activeColor: ColorConstants.primaryColor,
        ),
      ],
    );
  }
}
