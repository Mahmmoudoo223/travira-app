import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends GetWidget<AuthViewModel> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("8".tr),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Get.off(LoginView());
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Text(
                    "8".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Reboto"),
                  ),
                  SizedBox(
                    height: Dimentions.height5,
                  ),
                  Text(
                    "52".tr,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimentions.height70),
                  CustomTextFormField(
                      text: "4".tr,
                      hint: "5".tr,
                      obx:false,
                      obs: false,
                      onSave: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),

                  SizedBox(height: 16),

                  CustomButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.ResetPassword();
                      }
                    },
                    text: "53".tr,
                  ),
                  SizedBox(
                    height: Dimentions.height50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "10".tr,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 3,
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        child: Text(
                          "2".tr,
                          style: TextStyle(
                              fontSize: 16, color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ])),
          ),
        ));
  }
}
