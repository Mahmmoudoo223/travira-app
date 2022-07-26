import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String email=box.read('email');
    String name=box.read('name');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Profile Edit"),
        textTheme:
            TextTheme(headline6: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      body: BodyEdit(
        name: name,
        email: email,
      ),
    );
  }
}
