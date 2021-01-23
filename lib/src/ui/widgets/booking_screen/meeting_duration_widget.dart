import 'package:meeting_planner_app/src/ui/utils/common_util.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class MeetingDurationWidget extends StatefulWidgetBase {

  Function(int) onSelectMeetingDuration;
  int defaultValue;

  MeetingDurationWidget(this.onSelectMeetingDuration, this.defaultValue);

  @override
  _MeetingDurationWidgetState createState() => _MeetingDurationWidgetState();
}

class _MeetingDurationWidgetState extends State<MeetingDurationWidget> {

  String _selectedDuration;
  final List<String> durationList = [
    '30 minutes',
    '45 minutes',
    '1 hour',
    '1 hour 30 minutes',
  ];

  @override
  void initState() {
    _selectedDuration = widget.defaultValue == null ? '30 minutes' : CommonUtil.instance.getDurationString(widget.defaultValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.defaultValue != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).meeting_duration, style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: Colors.black54)),
          SizedBox(height: 8,),
          _durationDropdown(),
        ],
      ),
    );
  }

  _durationDropdown() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(widget.defaultValue != null ? 0.1 :0.3)),
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
              widget.onSelectMeetingDuration(CommonUtil.instance.getDurationInMinutes(_selectedDuration));
            },
            hint: Text(S.of(context).meeting_duration,
                style: TextStyle(
                  fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0
                )),
            items: durationList.map<DropdownMenuItem<String>>((String value) {
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
    );
  }
}
