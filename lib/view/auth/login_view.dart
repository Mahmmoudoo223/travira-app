import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/sales/sales_login_view.dart';
import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:get_storage/get_storage.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("2".tr),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: Dimentions.height30,
                ),
                Text(
                  "1".tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Reboto"),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3".tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Dimentions.height40,
                ),
                Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: Dimentions.height20),
                      CustomTextFormField(
                          text: "4".tr,
                          hint: "5".tr,
                          obx: false,
                          obs: false,
                          onSave: (value) {
                            //   controller.email = value;
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: Dimentions.height20),
                      CustomTextFormField(
                          text: "6".tr,
                          hint: "7".tr,
                          obs: true,
                          obx: true,
                          onSave: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: Dimentions.height15),
                      // InkWell(
                      //   child: Custom_Text(
                      //     text: "Forget Password",
                      //     fontSize: 14,
                      //     alignment: Alignment.topRight,
                      //   ),
                      //   onTap: () {
                      //     Get.to(ForgetPasswordView());
                      //   },
                      // ),
                      Row(
                        children: [
                          // Checkbox(
                          //     value: true,
                          //     activeColor: Colors.blue,
                          //     onChanged: (Value) {}),
                          // Text("Remember me"),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(ForgetPasswordView());
                            },
                            child: Text(
                              "8".tr,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Reboto"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Dimentions.height20),
                      CustomButton(
                        onPressed: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            //controller.signInWithPhoneAndPassword();
                            controller.signInWithEmailAndPassword();
                          }
                        },
                        text: "9".tr,
                      ),
                      SizedBox(height: Dimentions.height40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10".tr,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width:3),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterView());
                            },
                            child: Text(
                              "11".tr,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimentions.height15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "12".tr,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width:3),
                          GestureDetector(
                            onTap: () {
                              final box = GetStorage();
                              String sales_email =
                                  box.read('sales_email') ?? "i";
                              String sales_name = box.read('sales_name') ?? "i";
                              print("ss=" + sales_name);
                              //   if (sales_name == 'i') {
                              Get.to(SalesLoginView());
                              // } else {
                              //   Get.to(SalesDetails(
                              //     name: sales_name,
                              //     email: sales_email,
                              //   ));
                              // }
                            },
                            child: Text(
                              "13".tr,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                      // InkWell(
                      //   child: Container(
                      //       width: 250,
                      //       decoration: BoxDecoration(
                      //           color: Colors.lightBlueAccent,
                      //           borderRadius: BorderRadius.only(
                      //             topRight: Radius.circular(70),
                      //             topLeft: Radius.circular(70),
                      //           )),
                      //       child: Directionality(
                      //         textDirection: TextDirection.rtl,
                      //         child: Center(
                      //           child: Text(
                      //             "   لمندوبين Travira فقط  ",
                      //             style: TextStyle(
                      //                 fontSize: 21, color: Colors.white),
                      //           ),
                      //         ),
                      //       )),
                      //   onTap: () {
                      //     final box = GetStorage();
                      //     String sales_email = box.read('sales_email') ?? "i";
                      //     String sales_name = box.read('sales_name') ?? "i";
                      //     print("ss=" + sales_name);

                      //     if (sales_name == 'i') {
                      //       Get.to(SalesView());
                      //     } else {
                      //       Get.to(SalesDetails(
                      //         name: sales_name,
                      //         email: sales_email,
                      //       ));
                      //     }
                      //   },
                      // )

                      // Custom_Text(
                      //   text: '_OR_',
                      //   alignment: Alignment.center,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // CustomButtonSocial(
                      //   text: 'Sign In With Facebook',
                      //   imageName: 'assets/f1.png',
                      // ),
                      // CustomButtonSocial(
                      //   text: 'Sign In With Google',
                      //   imageName: 'assets/g1.png',
                      //   onPressed: () {
                      //   //  controller.sginInWithGoogle();
                      //      controller.googleSignInMehtod();
                      //   },
                      // ),
                    ])),
              ],
            ),
          ),
        ))));
  }
}
