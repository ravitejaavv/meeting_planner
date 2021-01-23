import 'package:meeting_planner_app/src/models/ui_models/priority_model.dart';
import 'package:meeting_planner_app/src/ui/utils/logger.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

enum Priority { high, medium, low }

class PriorityWidget extends StatefulWidgetBase {

  final Function(int) onChangePriority;
  final bool isSubmitted;
  final int defaultValue;

  PriorityWidget(this.onChangePriority, this.isSubmitted, this.defaultValue);

  @override
  _PriorityWidgetState createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  List<PriorityItem> priorityList;
  Priority _selectedPriority;

  @override
  void initState() {
    if(widget.defaultValue != null){
      switch(widget.defaultValue){
        case 1:
          _selectedPriority = Priority.high;
          break;
        case 2:
          _selectedPriority = Priority.medium;
          break;
        case 3:
          _selectedPriority = Priority.low;
          break;
      }
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (priorityList == null) {
      priorityList = [
        PriorityItem(S.of(context).priority_high, Priority.high),
        PriorityItem(S.of(context).priority_medium, Priority.medium),
        PriorityItem(S.of(context).priority_low, Priority.low)
      ];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.defaultValue != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.defaultValue == null ? S.of(context).choose_priority : S.of(context).priority,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: Colors.black54)),
          Row(
            children: <Widget>[for (var item in priorityList) _getChild(item)],
          ),
          Visibility(
              visible: widget.isSubmitted && _selectedPriority == null,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                child: Text(
                  S.of(context).choose_meeting_priority,
                  style: TextStyle(
                      color: ColorConstants.redErrorColor,
                      fontSize: 12.0),
                ),
              )),
        ],
      ),
    );
  }

  _getChild(PriorityItem item) {
    return Row(
      children: [
        Radio(
          value: item.priorityType,
          groupValue: _selectedPriority,
          onChanged: (Priority value) {
            setState(() {
              _selectedPriority = value;
            });
            MyLogger.print("_selectedPriority.index+1 "+_selectedPriority.index.toString());
            widget.onChangePriority(_selectedPriority.index+1);
          },
        ),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
