import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meeting_planner_app/generated/l10n.dart';
import 'package:meeting_planner_app/src/models/ui_models/room_model.dart';
import 'package:meeting_planner_app/src/ui/resources/color_constants.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';

class ChooseMeetingWidget extends StatefulWidget {
  final Function(String) onSelectMeetingRoom;
  final bool isSubmitted;
  final String defaultValue;

  ChooseMeetingWidget(
      this.onSelectMeetingRoom, this.isSubmitted, this.defaultValue);

  @override
  _ChooseMeetingWidgetState createState() => _ChooseMeetingWidgetState();
}

class _ChooseMeetingWidgetState extends State<ChooseMeetingWidget> {
  List<RoomItem> rooms;
  RoomItem _selectedRoom;

  @override
  void initState() {
    rooms = MeetingRooms.fromJson(json.decode(prefsHelper.getMeetigRoomDetails())).meetingRooms;

    if (widget.defaultValue != null) {
      rooms.forEach((element) {
        if (element.title.compareTo(widget.defaultValue) == 0) {
          _selectedRoom = element;
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.defaultValue != null,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.defaultValue == null
                  ? S.of(context).choose_meeting_room
                  : S.of(context).meeting_room,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: Colors.black54),
            ),
            _buildRooms(),
            Visibility(
                visible: widget.isSubmitted && _selectedRoom == null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                  child: Text(
                    S.of(context).select_meeting_date_time,
                    style: TextStyle(
                        color: ColorConstants.redErrorColor, fontSize: 12.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _buildRooms() {
    return Container(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return _buildItem(rooms[index]);
          }),
    );
  }

  _buildItem(RoomItem room) {
    bool isSelected = (_selectedRoom == null) ? false : room == _selectedRoom;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedRoom = room;
              });
              widget.onSelectMeetingRoom(room.title);
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Color(room.colorCode)),
                child: Center(
                    child: Text(room.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.white,))
                )
            ),
          ),
          Visibility(
            visible: isSelected,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
