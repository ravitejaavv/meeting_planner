import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';
import 'package:shimmer/shimmer.dart';

class CommonWidget{

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static initializePlatformSpecifics() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_notification');
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // your call back to the UI
      },
    );
    var initSettings = new InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> scheduleNotification(int minutes, String title, String description) async {
    var scheduleNotificationDateTime = DateTime.now().add(Duration(seconds: 5));
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID 1',
      'CHANNEL_NAME 1',
      "CHANNEL_DESCRIPTION 1",
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
    );
    var iosChannelSpecifics = IOSNotificationDetails(
      sound: 'my_sound.aiff',
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidChannelSpecifics,
      iOS: iosChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(
      0,
      title,
      description,
      scheduleNotificationDateTime,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  AppBar getAppBar(BuildContext context, String title,
      {backActionRequired = true,
        Function(int) onBackPressed,
        int isFrom,
        Color titleColor = Colors.white,
        double fontSize = 16.0,
        bool isNormal = true,
        double letterSpacing = 1.0,
        isActionRequired = false,
        Widget actionWidget,
        String actionName = "",
        Color actionTextColor = Colors.white,
        double widthOfAction = 65.0,
        Function() onActionClicked,
        backgroundColor = ColorConstants.primaryColor, bool isCenterTitle = true, double elevation = 5.0, }) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      leading: backActionRequired
          ? InkResponse(
          onTap: () {
            if (onBackPressed != null) {
              onBackPressed(isFrom);
            } else {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding:
            const EdgeInsets.only(right: 0.0, top: 18.0, bottom: 18.0),
            child: (titleColor == Colors.white)
                ? Icon(Icons.arrow_back, color: Colors.white,)
                : Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.6),),
          ))
          : null,
      actions: isActionRequired
          ? <Widget>[
        (actionWidget == null)
            ? SizedBox(
          width: widthOfAction,
          child: FlatButton(
            onPressed: () {
              onActionClicked();
            },
            child: Text(
              "$actionName",
              style: TextStyle(
                  color: actionTextColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
            : actionWidget
      ]
          : null,
      centerTitle: isCenterTitle,
      title: Text(
        title,
        style: isNormal
            ? TextStyle(
            color: titleColor,
            fontStyle: FontStyle.normal,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: letterSpacing)
            : TextStyle(
            color: titleColor,
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            letterSpacing: letterSpacing),
      ),
    );
  }


  getLoaderList(int count){
    return ListView.separated(
      itemCount: count,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                height: 60,
                width: 60,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 10,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
      const Divider(),
    );
  }
}