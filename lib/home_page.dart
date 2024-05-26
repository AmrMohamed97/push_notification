import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_function/testt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> _sendNOtification(topic) async {
    String serverKey =
        'AAAAAxMjiJE:APA91bG8bLJG0yIdZSHq3862aDlHBjJ4_8W-pzDtS8gBqhecY1UEJeFbymuGcpjpEFKgRwZuCZDRNLtLcw3QzWICuCflvoxEiYsv1JMv_jTNSvuXEU8rNpWZL5-VR3qZW7wuZQnXavl0';
    Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    // String? token = await FirebaseMessaging.instance.getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };
    http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        'notification': {'body': 'Hello', 'title': 'Amr'},
        'priority': 'high',
        'to': '/topics/$topic',
      }),
      
    );
    if (response.statusCode == 200) {
      print('notification sent');
      return jsonDecode(response.body);
    }
    throw Exception('Failed to send notification');
  }

  Future<void> terminatedNotificationPress() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    print('run...........................................................');
    if (initialMessage != null) {
      print('${initialMessage?.notification!.body}');
      print('====================terminated Press==========================');
      print('${initialMessage?.notification!.title}');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Testt()));
    }
  }

  @override
  void initState() {
    terminatedNotificationPress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              _sendNOtification('amr');
            },
            child: const Text("Click me"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseMessaging.instance.unsubscribeFromTopic("amr");
              print('un subscribed');
            },
            child: const Text("un subscribe"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseMessaging.instance.subscribeToTopic('amr');
              print('subscribed');
            },
            child: const Text("subscribe"),
          )
        ],
      ),
    );
  }
}
