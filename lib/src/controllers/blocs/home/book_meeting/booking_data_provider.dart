import 'package:meeting_planner_app/src/models/booking_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  final tableMeetings = "bookings";

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "meeting_planner.db");
    var theDb = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute( "CREATE TABLE $tableMeetings(id INTEGER PRIMARY KEY, title TEXT, description TEXT, date_time TEXT, meeting_duration INTEGER, meeting_room TEXT, priority INTEGER, is_reminder INTEGER, reminder_duration INTEGER, is_cancelled INTEGER)");
    });
    return theDb;
  }

  DBHelper.internal();

  Future<BookingItem> insert(BookingItem bookingItem) async {
    var dbClient = await db;
    bookingItem.id = await dbClient.insert(tableMeetings, bookingItem.toMap());
    return bookingItem;
  }

  Future<BookingItem> getBookingItem(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableMeetings,
        columns: ['id', 'title', 'description', 'date_time', 'meeting_duration', 'meeting_room', 'priority', 'is_reminder', 'reminder_duration DEFAULT 0'],
        where: '$id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return BookingItem.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableMeetings, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<BookingItem>> getAllBookings() async {
    // Get a reference to the database.
    var dbClient = await db;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbClient.query(tableMeetings, orderBy: 'priority ASC');

    return List.generate(maps.length, (i) {
      return BookingItem(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        dateTime: maps[i]['date_time'],
        meetingDuration: maps[i]['meeting_duration'],
        meetingRoom : maps[i]['meeting_room'],
        priority: maps[i]['priority'],
        isReminder: maps[i]['is_reminder'],
        reminderDuration: maps[i]['reminder_duration'],
        isCancelled:  maps[i]['is_cancelled']
      );
    });
  }

  Future<int> updateData(BookingItem bookingItem) async {
    var dbClient = await db;
    return await dbClient.update(tableMeetings, bookingItem.toMap(),
        where: 'id = ?', whereArgs: [bookingItem.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}