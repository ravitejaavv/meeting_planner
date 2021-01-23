class RoomItem{
  int id;
  int colorCode;
  String title;

  RoomItem(this.id, this.colorCode, this.title);

  RoomItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorCode = json['colorCode'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['colorCode'] = this.colorCode;
    data['title'] = this.title;
    return data;
  }
}

class MeetingRooms{
  List<RoomItem> meetingRooms;

  MeetingRooms({this.meetingRooms});

  MeetingRooms.fromJson(Map<String, dynamic> json) {
    if (json['meetingRooms'] != null) {
      meetingRooms = List<RoomItem>();
      json['meetingRooms'].forEach((v) {
        meetingRooms.add(RoomItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meetingRooms != null) {
      data['meetingRooms'] = this.meetingRooms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}