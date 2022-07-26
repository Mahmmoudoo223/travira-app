


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/user_model.dart';



class FireStoreUser {
  final CollectionReference _userCollection=FirebaseFirestore.instance
      .collection('users');

  Future <void> addUserToFireStore(UserModel userModel)async{
    return await _userCollection.doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future <DocumentSnapshot>getCurrentUser(String uid)async{
      return await _userCollection.doc(uid).get();
  }
}