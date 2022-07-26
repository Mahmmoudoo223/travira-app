


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/carsoul_model.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/codes_model.dart';
import 'package:ecommerce/model/employes_model.dart';
import 'package:ecommerce/model/product_moidel.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodesViewModel extends GetxController{


  ValueNotifier<bool>get loading=>_loading;

  ValueNotifier<bool>_loading=ValueNotifier(false);


  List<CodesModel>get codeModel=>_codes;
  List <CodesModel> _codes=[];


  String value = '';


  @override
  void onInit() {
    super.onInit();
    getCodes();
  }

  CodesViewModel(){
    getCodes();

  }





  getCodes()async{
    _loading.value=true;
    HomeServices().getCodes().then((value){
      for(int i=0;i<value.length;i++){
        _codes.add(CodesModel.fromJson(value[i].data()));
        _loading.value=false;
      }
      print("codes="+_codes.toString());
      update();
    });
  }








  changeMethod(String val){
    value=val;
    update();
  }








}