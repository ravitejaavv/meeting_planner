import 'package:flutter/material.dart';

enum ActionType{calender, settings}

class ActionWidgets extends StatelessWidget {

  Function(ActionType) onActionClick;

  ActionWidgets(this.onActionClick);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkResponse(
          onTap: (){
            onActionClick(ActionType.calender);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ),
        SizedBox(width: 5,),
        InkResponse(
          onTap: (){
            onActionClick(ActionType.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ),
        SizedBox(width: 5,),
      ],
    );
  }
}
