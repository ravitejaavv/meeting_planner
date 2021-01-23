import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

import 'meeting_room_color_widget.dart';

class MeetingRoomSettingsWidget extends StatefulWidgetBase {
  @override
  _MeetingRoomSettingsWidgetState createState() =>
      _MeetingRoomSettingsWidgetState();
}

class _MeetingRoomSettingsWidgetState extends State<MeetingRoomSettingsWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showRoomSettingsAlertWidget();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 12.0),
        child: Row(
          children: [
            Text(S.of(context).meeting_rooms_color_code,
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

  _showRoomSettingsAlertWidget() {
    //_setupData();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: MeetingRoomColorWidget(),
          );
        });
  }
}
