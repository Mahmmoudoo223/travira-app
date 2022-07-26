
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/codes_view_model.dart';
import 'package:ecommerce/viewmodel/employee_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("11".tr),
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
          padding: EdgeInsets.only(
              top: Dimentions.height20,
              right: Dimentions.width20,
              left: Dimentions.width20),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
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
                SizedBox(height: Dimentions.height20),
                CustomTextFormField(
                    text: "17".tr,
                    obx:false,
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

                //  _listViewCodes(),
                //  SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                  text: "11".tr,
                ),
                SizedBox(height: Dimentions.height20),
              ])),
        )));
  }

  // Widget _listViewCodes() {
  //   TextEditingController promo = TextEditingController();
  //   return GetBuilder<CodesViewModel>(
  //     init: Get.find(),
  //     builder: (controller) => SingleChildScrollView(
  //       child: Container(
  //         height: 120,
  //         child: ListView.separated(
  //           itemCount: 1, //controller.employeeModel.length,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) {
  //             //controller.codeModel[index].codes.toString(),
  //             return Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Directionality(
  //                     textDirection: TextDirection.rtl,
  //                     child: Container(
  //                       width: 350,
  //                       child: TextFormField(
  //                         controller: promo,
  //                         textAlign: TextAlign.left,
  //                         decoration: InputDecoration(
  //                           hintText: "24".tr,
  //                           hintStyle: TextStyle(fontSize: 15),
  //                         ),
  //
  //                         // validator: (value) {
  //                         //   if (value.isEmpty) {
  //                         //     return "ادخل البرومو كود  ";
  //                         //   }
  //                         // },
  //                         onSaved: (value) {
  //                           print(value);
  //                           promo.text = value;
  //                           if (promo.text.contains(controller
  //                               .codeModel[index].codes
  //                               .toString()
  //                               .split(',')
  //                               .toString())) {
  //                             print("ttttt");
  //                           } else {
  //                             print("xxx");
  //                           }
  //                         },
  //                       ),
  //                     )),
  //                 Text(
  //                   "46".tr,
  //                   style: TextStyle(
  //                     color: Colors.lightBlue,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 GetBuilder<AuthViewModel>(
  //                     init: Get.find(),
  //                     builder: (controller3) => Column(
  //                           children: [
  //                             GetBuilder<EmployeeViewModel>(
  //                               init: Get.find(),
  //                               builder: (controller2) => RaisedButton(
  //                                   color: Colors.lightBlue,
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(15)),
  //                                   child: Text(
  //                                     "11".tr,
  //                                     style: TextStyle(
  //                                         fontSize: 20,
  //                                         fontWeight: FontWeight.bold,
  //                                         color: Colors.white),
  //                                   ),
  //                                   onPressed: () async {
  //                                     _formKey.currentState.save();
  //                                     if (_formKey.currentState.validate()) {
  //                                       final box = GetStorage();
  //                                       String coponCode =
  //                                           box.read('code_start') ?? "x";
  //
  //                                       //   if(coponCode == 'x') {
  //                                       if (promo.text.isEmpty) {
  //                                         controller3
  //                                             .createAccountWithPhoneAndPassword();
  //                                       }
  //
  //                                       if (controller.codeModel[index].codes
  //                                           .contains(promo.text)) {
  //                                         print("ttt");
  //                                         Firestore.instance
  //                                             .collection('emp')
  //                                             .where("code",
  //                                                 isEqualTo: promo.text)
  //                                             .get()
  //                                             .then((snapshot) async {
  //                                           print("sss" +
  //                                               snapshot.docs[index]['name']
  //                                                   .toString());
  //                                           snapshot.docs.first.reference
  //                                               .update({
  //                                             'downloads': snapshot.docs[index]
  //                                                     ['downloads'] +
  //                                                 1
  //                                           }).then((value) async {
  //                                             final box = GetStorage();
  //                                             box.write(
  //                                                 'code_start', promo.text);
  //
  //                                             Get.snackbar('Congratulations ',
  //                                                 ' Code Activate Successfully ',
  //                                                 colorText: Colors.white,
  //                                                 backgroundColor:
  //                                                     Colors.lightGreen);
  //                                             controller3
  //                                                 .createAccountWithPhoneAndPassword();
  //                                           });
  //                                         });
  //                                       }
  //
  //                                       else {
  //                                         Get.snackbar(
  //                                             'Wrong ', '  Wrong Code ',
  //                                             colorText: Colors.white,
  //                                             backgroundColor: Colors.red);
  //                                         controller3
  //                                             .createAccountWithPhoneAndPassword();
  //
  //                                       }
  //                                     } else {
  //                                       print("ddduuuuuuuuu");
  //                                     }
  //                                     //_formKey.currentState.save();
  //                                     // if (_formKey.currentState.validate()) {
  //                                     //   final box = GetStorage();
  //                                     //   String coponCode=box.read('code')??"x";
  //                                     //
  //                                     //   //   if(coponCode == 'x') {
  //                                     //   if (controller.codeModel[index].codes
  //                                     //       .contains(promo.text)) {
  //                                     //     print("ttt");
  //                                     //     Firestore.instance
  //                                     //         .collection('emp')
  //                                     //         .where("code", isEqualTo: promo.text)
  //                                     //         .get()
  //                                     //         .then((snapshot) async {
  //                                     //       print("sss"+snapshot.docs[index]['name'].toString());
  //                                     //       snapshot.docs.first.reference.update({
  //                                     //         'coins':snapshot.docs[index]['coins']+1
  //                                     //
  //                                     //       }).then((value) async {
  //                                     //         final box = GetStorage();
  //                                     //         box.write('code', promo.text);
  //                                     //
  //                                     //         Get.snackbar(
  //                                     //             'مبرووووك ',
  //                                     //             ' تم التفعيل الخصم السياحي ',
  //                                     //             colorText: Colors.white,
  //                                     //             backgroundColor: Colors.lightGreen
  //                                     //         );
  //                                     //
  //                                     //       });
  //                                     //     });
  //                                     //   } else {
  //                                     //     Get.snackbar(
  //                                     //         'خطا ',
  //                                     //         ' تم التفعيل الخصم من قبل ',
  //                                     //         colorText: Colors.white,
  //                                     //         backgroundColor: Colors.red
  //                                     //     );
  //                                     //   }
  //                                     // }
  //                                     // else{
  //                                     //
  //                                     // }
  //                                     // }
  //                                   }),
  //                             ),
  //                           ],
  //                         ))
  //               ],
  //             );
  //           },
  //           separatorBuilder: (context, index) => SizedBox(
  //             width: 20,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
