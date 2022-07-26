

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {

  final CollectionReference _categoryCollectionRef = FirebaseFirestore.instance
      .collection("services");

  final CollectionReference _empCollectionRef = FirebaseFirestore.instance
      .collection("emp");

  final CollectionReference _codesCollectionRef = FirebaseFirestore.instance
      .collection("codes");

  final CollectionReference _productCollectionRef = FirebaseFirestore.instance
      .collection("hotels");

  final CollectionReference _carsoulCollectionRef = FirebaseFirestore.instance
      .collection("carsoul");

  Future <List<QueryDocumentSnapshot>> getCategory() async {
    var value=  await _categoryCollectionRef.get();
    return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getCodes() async {
    var value=  await _codesCollectionRef.get();
    return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getEmp() async {
    var value=  await _empCollectionRef.get();
    return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getBestSelling() async {
    var value=  await _productCollectionRef.get();
    return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getCarsoul() async {
    var value=  await _carsoulCollectionRef.get();
    return value.docs;
  }



}

