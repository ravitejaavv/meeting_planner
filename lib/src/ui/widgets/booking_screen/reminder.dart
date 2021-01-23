import 'package:meeting_planner_app/src/ui/widgets/booking_screen/reminder_duration_widget.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class ReminderWidget extends StatefulWidgetBase {

  final Function(bool, int) onChangeReminder;
  final bool isSubmitted;
  final int defaultValue;
  final bool isEnabled;

  ReminderWidget(this.onChangeReminder, this.isSubmitted, this.defaultValue, this.isEnabled);

  @override
  _ReminderWidgetState createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  bool isSwitched = false;

  @override
  void initState() {
    if(widget.defaultValue != null) isSwitched = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.isEnabled,
      child: Column(
        children: [
          Row(
            children: [
              Text(S.of(context).reminder_yes_no,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.black54)),
              SizedBox(
                width: 10,
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                  widget.onChangeReminder(isSwitched, null);
                },
                activeTrackColor: ColorConstants.primaryLightColor,
                activeColor: ColorConstants.primaryColor,
              ),
            ],
          ),
          SizedBox(height: 5,),
          Visibility(visible: isSwitched, child: ReminderDurationWidget(widget.onChangeReminder, widget.isSubmitted, widget.defaultValue, widget.isEnabled)),
        ],
      ),
    );
  }
}
