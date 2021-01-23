import 'package:meeting_planner_app/src/ui/utils/common_util.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class ReminderDurationWidget extends StatefulWidgetBase {

  Function(bool, int) onChangeReminder;
  bool isSubmitted;
  int defaultValue;
  bool isEnabled;

  ReminderDurationWidget(this.onChangeReminder, this.isSubmitted, this.defaultValue, this.isEnabled);

  @override
  _ReminderDurationWidgetState createState() => _ReminderDurationWidgetState();
}

class _ReminderDurationWidgetState extends State<ReminderDurationWidget> {

  String _selectedDuration;

  @override
  void initState() {
    if(widget.defaultValue != null){
      _selectedDuration = CommonUtil.instance.getDurationString(widget.defaultValue);
    }else{
      _selectedDuration = '15 minutes';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _durationDropdown();
  }

  _durationDropdown() {
    return AbsorbPointer(
      absorbing: !widget.isEnabled,
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(widget.defaultValue != null ? 0.1 : 0.3)),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: DropdownButton<String>(
              value: _selectedDuration,
              isDense: true,
              isExpanded: true,
              underline: SizedBox(
                width: 0,
              ),
              elevation: 0,
              onChanged: (String newValue) {
                setState(() {
                  _selectedDuration = newValue;
                });
                widget.onChangeReminder(true, CommonUtil.instance.getDurationInMinutes(_selectedDuration));
              },
              hint: Text(S.of(context).meeting_duration,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0
                  )),
              items: <String>[
                '15 minutes',
                '30 minutes',
                '24 hours',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
