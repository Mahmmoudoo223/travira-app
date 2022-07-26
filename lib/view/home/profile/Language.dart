
import 'package:ecommerce/view/home/profile/Language_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

class Language extends StatelessWidget {
  const Language({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String sales = box.read("sales_name") ?? 'w';
    String sales2 = box.read("sales_email") ?? 'w';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("57".tr),
        titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
      ),
      backgroundColor: Colors.white,
      body: LanguageBody(),
    );
  }
}
