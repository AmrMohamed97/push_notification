import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_function/firebase_options.dart';
import 'package:first_function/local_notification_service.dart';
import 'package:first_function/test_local_notification.dart';
import 'package:first_function/work_manager_service.dart';
import 'package:flutter/material.dart';

Future<void> initializeNotifications() async {
  await FirebaseMessaging.instance.requestPermission();
  String? token = await FirebaseMessaging.instance.getToken();
  debugPrint('token: $token ');
}

Future<void> getMessage() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      debugPrint(message.notification!.body);
      print('==============================================');
      debugPrint(message.notification!.title);
    }
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    debugPrint('${message.notification?.body}');
    print('====================background==========================');
    debugPrint('${message.notification?.title}');
  }
}

Future<void> backgroundNotificationPress() async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      debugPrint(message.notification!.body);
      print('====================background Press==========================');
      debugPrint(message.notification!.title);
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeNotifications();
  await LocalNotificationServices.initialize();

  backgroundNotificationPress();
  getMessage();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  //--------------------------local notifications-------------------------------

  await WorkManagerService().init();
  runApp(const MyFirstFunction());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyFirstFunction extends StatefulWidget {
  const MyFirstFunction({super.key});

  @override
  State<MyFirstFunction> createState() => _MyFirstFunctionState();
}

class _MyFirstFunctionState extends State<MyFirstFunction> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const TestLocalNotification(),
    );
  }
}
