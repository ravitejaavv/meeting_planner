import 'dart:convert';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meeting_planner_app/src/models/ui_models/room_model.dart';
import 'package:meeting_planner_app/src/ui/utils/sharedpreference_helper.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class MeetingRoomColorWidget extends StatefulWidgetBase {
  @override
  _MeetingRoomColorWidgetState createState() => _MeetingRoomColorWidgetState();
}

class _MeetingRoomColorWidgetState extends State<MeetingRoomColorWidget> {

  List<RoomItem> rooms;
  Color newColor;

  @override
  void initState() {
    _setupData();
    super.initState();
  }

  _setupData(){
    rooms =
        MeetingRooms.fromJson(json.decode(prefsHelper.getMeetigRoomDetails()))
            .meetingRooms;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).click_to_update,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 10.0,
              ),
              _buildRooms(),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    prefsHelper.setMeetigRoomDetails(json.encode(MeetingRooms(meetingRooms: rooms)));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    S.of(context).update_title,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: ColorConstants.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildRooms() {
    return Container(
        child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5.0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(rooms.length, (index) {
              return _buildItem(rooms[index], index);
            })));
  }

  _buildItem(RoomItem room, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          newColor = null;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(S.of(context).choose_color),
                  content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: Color(room.colorCode),
                        onColorChanged: (newColor) {
                          this.newColor = newColor;
                        },
                      )),
                  actions: [
                    FlatButton(
                        child: Text(S.of(context).yes_title.toUpperCase(), style: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.w600),),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (newColor != null) {
                            setState(() {
                              rooms[index].colorCode = newColor.value;
                            });
                          }
                        }),
                    FlatButton(
                        child: Text(S.of(context).no_title.toUpperCase(), style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                );
              });
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(room.colorCode),
          ),
          child: Center(
              child: Text(room.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.white,
                  ))),
        ),
      ),
    );
  }
}
