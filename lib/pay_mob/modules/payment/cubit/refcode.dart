



 import 'package:ecommerce/pay_mob/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RefCode2 extends StatelessWidget {


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [

           //   Text("you should goto any market to pay "),
              SizedBox(height:11,),
              Text("68".tr,
              style:TextStyle(color:Colors.black,fontSize:21,fontWeight:FontWeight.w700),
              ),
              SizedBox(height:11,),
              Container(
                width:220,
                child: Card(
                  elevation: 12,
                  child: Text(" "+RefCode,style:TextStyle(color:Colors.redAccent,fontSize: 40),),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
