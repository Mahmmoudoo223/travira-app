import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/locale/locale_controller.dart';
import 'package:ecommerce/view/home/main_home.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLoacleController controllerLang = Get.find();
    final box = GetStorage();
    String sales = box.read("sales_name") ?? 'w';
    String sales2 = box.read("sales_email") ?? 'w';

    return Column(
      children: [
        SizedBox(height: Dimentions.height70),
        //ProfilePic(),
        SizedBox(height: Dimentions.height40),
        ProfileMenu(
          icon: "assets/arabic.svg",
          text: "58".tr,
          press: () {
            controllerLang.ChangeLang("ar");
            Get.off(MainPage());
          },
        ),
        // ProfileMenu(
        //   icon: "assets/22.svg",
        //   text: "Language",
        //   press: () {},
        // ),
        ProfileMenu(
          icon: "assets/english-11.svg",
          text: "59".tr,
          press: () {
            controllerLang.ChangeLang("en");
            Get.off(MainPage());
          },
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
    Null Function() onpress,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          padding: EdgeInsets.all(Dimentions.height20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.black54,
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: Dimentions.width22,
                color: Colors.yellow,
              ),
              SizedBox(width: Dimentions.Radius20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )),
              // Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
