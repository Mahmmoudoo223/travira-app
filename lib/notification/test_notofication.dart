


// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;



class notification_test extends StatefulWidget {

  @override
  State<notification_test> createState() => _notification_testState();
}



class _notification_testState extends State<notification_test> {
  final String serverToken = 'AAAAyR7_AYo:APA91bFcOkr47vogoJFYNbiHktItiDDCCNySablqwVa3duVilFwvOeLuyG9HNZegnIm-Tu4kIRuuEo4ZRVSgsUQuSXfZ6wcocVtrVc5prHtUYk49z6cV23epMswvBmDY4SEvCRsGHShz';

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
 var fbm=FirebaseMessaging;


  @override
  void initState() {
  // Firebase.initializeApp();
    super.initState();
  // print("ffff="+firebaseMessaging.getToken().toString());

  }

  // initialMessage()async{
  //   print("ffff="+firebaseMessaging.getToken().toString());
  // }


  @override
  Widget build(BuildContext context) {
    // Replace with server token from firebase console settings.

    return Scaffold(
      body:Container(
        child:Column(
          children:[
            SizedBox(
              height:30
            ),
            RaisedButton(
              onPressed:(){
                sendNotify();
                print("ooo");
              },
            )
          ]
        )
      )
    );
  }

  sendNotify() async{


  Future<Map<String, dynamic>> sendAndRetrieveMessage() async {

    await firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true,
          alert: true, provisional: false),
    );

    final Completer<Map<String, dynamic>> completer =
    Completer<Map<String, dynamic>>();

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        completer.complete(message);
      },
    );

    return completer.future;
  }{
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': await firebaseMessaging.getToken(),
        },
      ),
    );
  }
  getMessages(){
    print(firebaseMessaging.getToken());
  }
}}
