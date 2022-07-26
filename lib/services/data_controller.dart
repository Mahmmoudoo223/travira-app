import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();

    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection("services")
        .where('city', isEqualTo: queryString)
        .get();
  }
}
