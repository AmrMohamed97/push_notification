import 'package:first_function/local_notification_service.dart';
import 'package:first_function/next_local_notification.dart';
import 'package:flutter/material.dart';

class TestLocalNotification extends StatefulWidget  {
  const TestLocalNotification({super.key});

  @override
  State<TestLocalNotification> createState() => _TestLocalNotificationState();
}

//--
class _TestLocalNotificationState extends State<TestLocalNotification>  with TickerProviderStateMixin{
 late AnimationController _animationController;

@override
void initState() {
  super.initState();
  messagePressListener();
  _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
}


  void messagePressListener() {
    LocalNotificationServices.streamController.stream.listen((event) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const NextLocalNotification();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notification'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  await LocalNotificationServices.sendBasicNotification();
                },
                child: const Text("Basic Notification "),
              ),
             IconButton(
  onPressed: () async {
    await LocalNotificationServices.cancelNotification(0);
    _animationController.forward(from: 0.0);
  },
  icon: ScaleTransition(
    scale: _animationController,
    child: Icon(
      Icons.cancel,
      color: Colors.red,
    ),
  ),
)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  await LocalNotificationServices.sendPeriodicNotification();
                },
                child: const Text("Periodicly Notification "),
              ),
              IconButton(
                onPressed: () async {
                  await LocalNotificationServices.cancelNotification(1);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  await LocalNotificationServices.sendScheduledNotification();
                },
                child: const Text("Scheduled Notification "),
              ),
              IconButton(
                onPressed: () async {
                  await LocalNotificationServices.cancelNotification(2);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  @override
void dispose() {
  _animationController.dispose();
  super.dispose();
}
}
