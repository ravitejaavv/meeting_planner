
class BookingItem{
  int id;
  String title;
  String description;
  String dateTime;
  int meetingDuration;
  String meetingRoom;
  int priority;
  int isReminder;
  int reminderDuration;
  int isCancelled;
  int colorCode;

  BookingItem(
  {this.id,
      this.title,
      this.description,
      this.dateTime,
      this.meetingDuration,
      this.meetingRoom,
      this.priority,
      this.isReminder,
      this.reminderDuration, this.isCancelled});

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date_time': dateTime,
      'meeting_duration': meetingDuration,
      'meeting_room': meetingRoom,
      'priority': priority,
      'is_reminder': isReminder,
      'reminder_duration': reminderDuration,
      'is_cancelled': isCancelled ?? 0
    };
  }

  BookingItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    dateTime = map['date_time'];
    meetingDuration = map['meeting_duration'];
    meetingRoom = map['meeting_room'];
    priority = map['priority'];
    isReminder = map['is_reminder'];
    reminderDuration = map['reminder_duration'];
    isCancelled = map['is_cancelled'];
  }

  @override
  String toString() {
    return 'BookingItem{id: $id, title: $title, description: $description, dateTime: $dateTime, meetingDuration: $meetingDuration, meetingRoom: $meetingRoom, priority: $priority, isReminder: $isReminder, reminderDuration: $reminderDuration. isCancelled: $isCancelled}';
  }
}