import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyEdit extends StatelessWidget {
  String name, email;
  BodyEdit({this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimentions.height10),
            child: Column(
              children: [
                SizedBox(
                  height: Dimentions.height20,
                ),
                Text(
                  "35".tr,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: Dimentions.height20,
                ),
                MenuForm(
                  name: name,
                  email: email,
                ),
                SizedBox(
                  height: Dimentions.height20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuForm extends StatefulWidget {
  String name, email;

  MenuForm({this.name, this.email});

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  final List<String> errors = [];
  TextEditingController password = TextEditingController();
  TextEditingController password_check = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // TextFormField(
          //   validator: (Value) {
          //     if (Value.isEmpty) {
          //       setState(() {
          //         errors.add("Please Enter Name");
          //       });
          //     }
          //     return null;
          //   },
          //   decoration: InputDecoration(
          //     labelText: "Name ",
          //     enabled: false,
          //     hintText:widget.name??"",
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //     contentPadding: EdgeInsets.symmetric(
          //       horizontal: 42,
          //       vertical: 20,
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(28),
          //       borderSide: BorderSide(
          //         color: Colors.blue[300],
          //       ),
          //       gapPadding: 10,
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(28),
          //       borderSide: BorderSide(
          //         color: Colors.blue[300],
          //       ),
          //       gapPadding: 10,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: Dimentions.height20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "4".tr,
              enabled: false,
              hintText: widget.email ?? "",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.Radius28),
                borderSide: BorderSide(color: Colors.yellow),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.Radius28),
                borderSide: BorderSide(color: Colors.yellow),
                gapPadding: 10,
              ),
            ),
          ),
          SizedBox(
            height: Dimentions.height50,
          ),
          Text(
            "36".tr,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: Dimentions.height20,
          ),
          TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "37".tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.Radius28),
                borderSide: BorderSide(color: Colors.yellow),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.Radius28),
                borderSide: BorderSide(color: Colors.yellow),
                gapPadding: 10,
              ),
            ),
          ),
          SizedBox(
            height: Dimentions.height20,
          ),
          TextFormField(
            controller: password_check,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "38".tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.Radius28),
                borderSide: BorderSide(color: Colors.yellow),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.Radius28),
                borderSide: BorderSide(color: Colors.yellow),
                gapPadding: 10,
              ),
            ),
          ),
          ////////////////////
          SizedBox(
            height: Dimentions.height50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: Dimentions.ViewContainer56,
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimentions.Radius20)),
                  color: Colors.yellow,
                  onPressed: () {
                    if (password_check.text.toString() !=
                        password.text.toString()) {
                      Get.snackbar('Wrong ', '  password didnot match',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    } else {
                      changePawword();
                      Get.off(MainPage());
                    }
                  },
                  child: Text(
                    "39".tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  changePawword() async {
    User user = FirebaseAuth.instance.currentUser;
    print("user" + user.toString());
    await user.updatePassword(password.text.toString());
    Get.snackbar('تم ', ' تم تغير الباسورد بنجاح ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    // Get.off(EditProfile());
    // FirebaseAuth.instance.signOut();
    // Get.offAll(ControlView());
  }
}
