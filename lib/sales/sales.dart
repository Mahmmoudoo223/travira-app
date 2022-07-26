import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/sales/sales_login_view.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/codes_view_model.dart';
import 'package:ecommerce/viewmodel/employee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SalesView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("14".tr),
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
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    height: Dimentions.height30,
                  ),
                  Text(
                    "15".tr,
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
                    "16".tr,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Dimentions.height40,
                  ),
                  // Container(
                  //   height: 120,
                  //  // child: Image.asset('assets/sora.jpg',
                  //  // ),
                  // ),
                  CustomTextFormField(
                      text: "17".tr,
                      obx: false,
                      hint: "18".tr,
                      obs: false,
                      onSave: (value) {
                        controller.name = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),
                  SizedBox(height: Dimentions.height20),
                  // CustomTextFormField(
                  //     text: "E_mail",
                  //     hint: "dev@yahoo.com",
                  //     onSave: (value) {
                  //       controller.email = value;
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         print("error");
                  //       }
                  //     }),
                  CustomTextFormField(
                      text: "4".tr,
                      hint: "5".tr,
                      obx: false,
                      obs: false,
                      onSave: (value) {
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
                      obx: true,
                      obs: true,
                      onSave: (value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),
                  SizedBox(height: Dimentions.height20),
                  CustomTextFormField(
                      text: "19".tr,
                      hint: "20".tr,
                      obx:false,
                      obs: false,
                      onSave: (value) {
                        controller.phone = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),

                  SizedBox(height: Dimentions.height20),
                  CustomTextFormField(
                      text: "21".tr,
                      hint: "22".tr,
                      obx: false,
                      obs: false,
                      onSave: (value) {
                        controller.passcode = value;
                      },
                      validator: (value) {
                        if (value != 'Travira001') {
                          return "كود غير صحيح";
                          //print("error");
                        }
                      }),
                  SizedBox(height: 20),

                  CustomButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.createSalesAccount();
                        //  controller.createAccountWithEmailAndPassword();
                      }
                    },
                    text: "11".tr,
                  ),
                  SizedBox(height: Dimentions.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "23".tr,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width:3,),

                      GestureDetector(
                        onTap: () {
                          Get.to(SalesLoginView());
                        },
                        child: Text(
                          "2".tr,
                          style: TextStyle(
                              fontSize: 16, color: Colors.redAccent),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 40),
                ]),
              )),
        ))));
  }
}
