import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/sales/sales_details.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/home/profile/Language.dart';
import 'package:ecommerce/view/home/profile/edit_profile.dart';
import 'package:ecommerce/view/profile/mytrips.dart';
import 'package:ecommerce/view/support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String sales = box.read("sales_name") ?? 'w';
    String sales2 = box.read("sales_email") ?? 'w';

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimentions.height40),
          ProfileMenu(
            icon: "assets/User Icon.svg",
            text: "31".tr,
            press: () {
              Get.to(EditProfile());
            },
          ),
          // ProfileMenu(
          //   icon: "assets/User Icon.svg",
          //   text: "31".tr,
          //   press: () {
          //     Get.to(EditProfile());
          //   },
          // ),
          if (sales2 != 'w')
            ProfileMenu(
              icon: "assets/salesman-salesman-svgrepo-com.svg",
              text: "103".tr,
              press: () {
                Get.off(SalesDetails(name: sales, email: sales2));
              },
            ),
          ProfileMenu(
            icon: "assets/history-svgrepo-com.svg",
            text: "33".tr,
            press: () {
              final box = GetStorage();
              String email = box.read("email") ?? 'w';
              Get.to(myTrips(
                email: email,
              ));
            },
          ),
          ProfileMenu(
            icon: "assets/22.svg",
            text: "32".tr,
            press: () {
              Get.to(Language());
            },
          ),

          ProfileMenu(
            icon: "assets/share.svg",
            text: "101".tr,
            press: () {
              share();
            },
          ),

          ProfileMenu(
            icon: "assets/support-technology-svgrepo-com.svg",
            text: "100".tr,
            press: () {
              Get.to(SupportScreen());
            },
          ),

          ProfileMenu(
            icon: "assets/Log out.svg",
            text: "34".tr,
            press: () {
              final box = GetStorage();
              box.remove('email');
              box.remove('sales_email');
              print("removed");
              FirebaseAuth.instance.signOut();
              Get.off(LoginView());
            },
          ),
        ],
      ),
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
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimentions.Radius15)),
          color: Colors.black54,
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: Colors.yellow,
              ),
              SizedBox(width: Dimentions.width20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}

Future<void> share() async {
  await FlutterShare.share(
      title: 'Travira',
      text: 'Download Travira App',
      linkUrl:
          'https://play.google.com/store/apps/details?id=com.team.tourism2022',
      chooserTitle: ' Travira App');
}
