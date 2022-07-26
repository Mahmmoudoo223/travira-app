


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/carsoul_model.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/employes_model.dart';
import 'package:ecommerce/model/product_moidel.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeViewModel extends GetxController{


  ValueNotifier<bool>get loading=>_loading;

  ValueNotifier<bool>_loading=ValueNotifier(false);



  List<EmployeeModel>get employeeModel=>_employee;
  List <EmployeeModel> _employee=[];




  String value = '';


  @override
  void onInit() {
    super.onInit();
    getEmp();
  }

  EmployeeViewModel(){
    getEmp();

  }



  getEmp()async{
    _loading.value=true;
    HomeServices().getEmp().then((value){
      for(int i=0;i<value.length;i++){
        _employee.add(EmployeeModel.fromJson(value[i].data()));
        _loading.value=false;
      }
      print("emp="+_employee.toString());
      update();
    });
  }




  travelcode (num price,num discount) {

    price=price-((price*discount)/100);
    return price;
    update();

  }



  changeMethod(String val){
    value=val;
    update();
  }








}