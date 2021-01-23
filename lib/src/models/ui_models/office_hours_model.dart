class OfficeHours{
  String startTime;
  String closingTime;

  OfficeHours({this.startTime, this.closingTime});

  OfficeHours.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    closingTime = json['closingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['closingTime'] = this.closingTime;
    return data;
  }
}