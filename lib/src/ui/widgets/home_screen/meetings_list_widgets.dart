import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meeting_planner_app/src/controllers/blocs/home/home_bloc.dart';
import 'package:meeting_planner_app/src/models/booking_model.dart';
import 'package:meeting_planner_app/src/models/ui_models/room_model.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/common_widget.dart';
import 'package:meeting_planner_app/src/ui/widgets/home_screen/no_meeting_widget.dart';

import 'booking_item_widget.dart';

class MeetingsListWidget extends StatefulWidget {

  HomeBloc homeBloc;
  Function(BookingItem) onItemClick;

  MeetingsListWidget(this.homeBloc, this.onItemClick);

  @override
  _MeetingsListWidgetState createState() => _MeetingsListWidgetState();
}

class _MeetingsListWidgetState extends State<MeetingsListWidget> with CommonWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Container(
        child: StreamBuilder<List<BookingItem>>(
            initialData: widget.homeBloc.bookingsList,
            stream: widget.homeBloc.bookingsStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<BookingItem> bookings = snapshot.data;
                if (bookings.length != 0) {
                  List<RoomItem> rooms = MeetingRooms.fromJson(json.decode(prefsHelper.getMeetigRoomDetails())).meetingRooms;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        RoomItem item = rooms.firstWhere((element) {
                          return element.title.compareTo(bookings[index].meetingRoom) == 0;
                        });
                        bookings[index].colorCode = item.colorCode;
                        return _buildItem(bookings[index]);
                      });
                } else {
                  return NoMeetingWidget(widget.homeBloc);
                }
              } else {
                return getLoaderList(8);
              }
            }),
      ),
    );
  }

  Widget _buildItem(BookingItem booking) {
    return BookingItemWidget(booking, widget.onItemClick);
  }
}
