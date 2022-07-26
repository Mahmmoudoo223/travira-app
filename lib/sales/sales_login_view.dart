import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/sales/sales.dart';

import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class SalesLoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("55".tr),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Get.off(LoginView());
            },
          ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [],
                                ),
                                SizedBox(height: 7),
                                Custom_Text(
                                  text: "54".tr,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: Dimentions.height20),
                                CustomTextFormField(
                                    text: "4".tr,
                                    hint: "5".tr,
                                    obs: false,
                                    obx: false,
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
                                    obx:true,
                                    hint: "7".tr,
                                    obs: true,
                                    onSave: (value) {
                                      controller.password = value;
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        print("error");
                                      }
                                    }),
                                SizedBox(height: Dimentions.height15),
                                InkWell(
                                  child: Custom_Text(
                                    text: "8".tr,
                                    fontSize: 14,
                                    alignment: Alignment.topRight,
                                  ),
                                  onTap: () {
                                    Get.to(ForgetPasswordView());
                                  },
                                ),
                                SizedBox(height: Dimentions.height40),
                                CustomButton(
                                  onPressed: () {
                                    _formKey.currentState.save();
                                    if (_formKey.currentState.validate()) {
                                      //controller.signInWithPhoneAndPassword();
                                      controller
                                          .salesSignInWithEmailAndPassword();
                                    }
                                  },
                                  text: "2".tr,
                                ),
                                SizedBox(height: Dimentions.height40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "56".tr,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(SalesView());
                                      },
                                      child: Text(
                                        "11".tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.redAccent),
                                      ),
                                    ),
                                  ],
                                ),
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
                    )))));
  }
}
