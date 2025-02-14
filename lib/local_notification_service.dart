import 'dart:async';

 import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationServices {
  static FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      static StreamController<NotificationResponse> streamController=StreamController();
      static void onTap(NotificationResponse notifyResponse) {
        print(notifyResponse.actionId);
        print('=================================');
        // navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) {
        //   return const NextLocalNotification();
        // }))??print('amr.....................');
        streamController.add(notifyResponse);
         print('=================================');
      }
  static Future<void> initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future<void> sendBasicNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '1',
      'Basic',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound.wav'.split('.').first),
    );
    NotificationDetails notificationDetail = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'title',
      'body',
      notificationDetail,
      payload: 'item x',
    );
  }

  static Future<void> sendPeriodicNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '2',
      'Periodicly',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetail = const NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Periodicly',
      'body',
      RepeatInterval.everyMinute,
      notificationDetail,
      payload: 'item x',
    );
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> sendScheduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      '3',
      'Scheduled',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails = const NotificationDetails(
      android: android,
      iOS: DarwinNotificationDetails(),
    );
    tz.initializeTimeZones();
    print('==============TZ============');
    print(tz.local.toString());
    print('==============TZ============');
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    print(tz.local.name);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'title',
      'body',
      tz.TZDateTime(
        tz.local,
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour,
        DateTime.now().minute + 1,
        DateTime.now().second,
        DateTime.now().millisecond,
        DateTime.now().microsecond,
      ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'item x',
    );
  }
}
