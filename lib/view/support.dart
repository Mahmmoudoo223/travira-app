import 'dart:io';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimentions.height20,
            ),
            Container(
              height: Dimentions.ViewContainer120,
              child: Image.asset('assets/support.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '102'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Reboto",
                ),
              ),
            ),
            SizedBox(
              height: Dimentions.height20,
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimentions.Radius10)),
                color: Colors.yellow,
                child: Text(
                  "support2".tr,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Reboto",
                      color: Colors.black),
                ),
                onPressed: () {
                  sendWhatsApp('+201007484001', "");
                })
          ],
        ),
      ),
    );
  }

  sendWhatsApp(String phone, String msg) async {
    String url() {
      if (Platform.isAndroid) {
        return 'whatsapp://send?phone=$phone&text=$msg';
        //'https://app.quicktype.io/';
        //'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {
        return 'whatsapp://wa.me/$phone&text=$msg';
      }
    }

    await canLaunch(url()) ? launch(url()) : launch(url());

    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('there is no whats app in your device')));
  }
}
