import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/profile/mytrips.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VodafoneCash extends GetWidget<AuthViewModel> {
  String name,
      email,
      phone,
      code,
      d_app,
      from,
      point,
      to,
      trip,
      nsba_offer,
      num,
      status,
      total;

  VodafoneCash(
      {this.name,
      this.email,
      this.phone,
      this.code,
      this.d_app,
      this.from,
      this.point,
      this.to,
      this.trip,
      this.nsba_offer,
      this.num,
      this.status,
      this.total});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool press = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.yellow,
          iconTheme: IconThemeData(
            color: Colors.yellow,
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(top: 44.0, right: 20.0, left: 20.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Text(
                  "67".tr,
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
                  "47".tr + " = " + total,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Reboto"),
                ),

                SizedBox(
                  height: Dimentions.height5,
                ),
                Text(
                  "74".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Reboto"),
                ),
                SizedBox(
                  height: Dimentions.height5,
                ),
                Text(
                  "16".tr,
                  //  textAlign: TextAlign.center,
                ),

                SizedBox(height: Dimentions.height40),
                CustomTextFormField(
                    text: "17".tr,
                    obx: false,
                    hint: "18".tr,
                    obs: false,
                    onSave: (value) {
                      controller.vodafone_name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 2) {
                        return ("Enter valid name");
                      }
                    }),
                SizedBox(height: Dimentions.height20),
                Center(
                  child: Custom_Text(
                    text: "71".tr,
                    color: Colors.red,
                    fontSize: 21,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: Dimentions.width20),
                    Text(
                      "01007484001",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    ),
                    SizedBox(width: 20),
                    Spacer(),
                    InkWell(
                        child: Container(
                            height: Dimentions.height40,
                            width: Dimentions.width90,
                            child: Image.asset('assets/copy2.jpg')),
                        onTap: () {
                          FlutterClipboard.copy("01007484001")
                              .then((value) => print('copied'));
                          Get.snackbar(
                            'Done',
                            ' Copied',
                            backgroundColor: Colors.lightGreen,
                            colorText: Colors.white,
                          );
                        })
                  ],
                ),

                SizedBox(height: Dimentions.height20),
                CustomTextFormField(
                    obx: false,
                    text: "72".tr,
                    hint: "73".tr,
                    obs: false,
                    onSave: (value) {
                      controller.vodafone_pay = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 2) {
                        return ("Enter valid information");
                      }
                    }),
                SizedBox(height: Dimentions.height25),

                RaisedButton(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimentions.Radius5)),
                    child: Text(
                      "70".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Reboto"),
                    ),
                    onPressed: () async {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        Get.snackbar("Done", "95".tr,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.lime,
                            duration: Duration(seconds: 3),
                            borderRadius: Dimentions.Radius10,
                            margin: EdgeInsets.all(10),
                            borderColor: Colors.yellow,
                            borderWidth: 2,
                            icon: Icon(Icons.add_task, color: Colors.white));

                        await Firestore.instance.collection('orders').add({
                          'name': name ?? "",
                          'vodafone_name': controller.vodafone_name ?? "",
                          'vodafone_pay_number': controller.vodafone_pay ?? "",
                          'email': email ?? "",
                          'phone': phone ?? "",
                          'code': code ?? "",
                          'd_app': d_app ?? "",
                          'from': from,
                          'type': 'vodafone_cash',
                          'point': "it will be updated soon",
                          'to': to,
                          'trip': trip,
                          // 'price':widget.price.toString(),
                          'nsba_offer': nsba_offer,
                          'num': num.toString(),
                          "status": "Waiting..",
                          "total": total,
                          "date": "Waiting..",
                          "time": "Waiting..",
                          "bus": "Waiting.."
                        });

                        Get.offAll(myTrips(
                          email: email,
                        ));
                      } else {
                        Get.snackbar("Error", "75".tr,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            borderRadius: Dimentions.Radius10,
                            margin: EdgeInsets.all(10),
                            borderColor: Colors.red,
                            borderWidth: 2,
                            icon: Icon(Icons.error, color: Colors.white));
                      }
                      //press=false;
                      // }
                    }),
                //    _listViewCodes(),
                SizedBox(height: Dimentions.height40),
              ])),
        )));
  }
}
