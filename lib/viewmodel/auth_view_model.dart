import 'dart:math';
import 'package:random_string_generator/random_string_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/codes_model.dart';
import 'package:ecommerce/sales/sales_details.dart';
import 'package:ecommerce/services/firestore_user.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:google_sign_in/google_sign_in.dart';


class AuthViewModel extends GetxController {

 // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name, phone, codeV, code,passcode;
  String vodafone_name,vodafone_pay;
  String country, city, details, mobile, brand_name, cat;
  TextEditingController email1, pass1, name1, code1;
  var verificationId;
  num price;
  Rx<User> _user = Rx<User>();
  int x2=1;
  get user => _user.value?.email;
  // final LocalStorageData localStorageData = Get.find();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }



  chooseCity( int p, int value,int shipping){

    x2=value;

    price= p* x2 + shipping;

    update();

  }

  // Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  // {
  //   GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  // }

  //  Future<void> googleSignInMehtod() async {
  //    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //    GoogleSignInAuthentication googleSignInAuthentication =
  //        await googleUser.authentication;
  // print("cc=" + googleUser.toString());
  //    final AuthCredential credential = GoogleAuthProvider.credential(
  //      idToken: googleSignInAuthentication.idToken,
  //      accessToken: googleSignInAuthentication.accessToken,
  //    );
  //
  //    print("cc=" + credential.toString());
  //    //UserCredential userCredential=
  //    await _auth.signInWithCredential(credential).then((user) async {
  //      await FireStoreUser().getCurrentUser(user.user.uid).then((value) {
  //        setUser(UserModel.fromJson(value.data()));
  //        print("Userr = " + _user.toString());
  //      });
  //      saveUser(user);
  //    });
  //    Get.offAll(HomeView());
  //  }

  void signInWithEmailAndPassword() async {
    final box = GetStorage();

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          print("Userr = " + _user.toString());
        });
      });

      box.write('email', email);
      box.write('pass', password);
      box.write('name', email);


      Get.offAll(MainPage());
      // if(box_country=='x'){
      //   Get.offAll(CountryView());
      // }
      // else{
      //   Get.offAll(ControlView());
      // }

    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void salesSignInWithEmailAndPassword() async {
    final box = GetStorage();

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          print("Userr = " + _user.toString());
        });
      });
      box.write('sales_name', name);
      box.write('sales_email', email);



      Get.off(MainPage());

      // Get.offAll(
      //     SalesDetails(
      //   email: email,
      //     name:name,
      // ));


    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createSalesAccount() async {

    var random = new Random();
    var x = random.nextInt(9);
    var x2= random.nextInt(999);
    var x3 =random.nextInt(13);

    print("gen="+x.toString());
    print("gen="+x2.toString());
    print("gen="+x3.toString());

    var code='';
    var code2='';
    List<CodesModel>code_model=[];
    CodesModel ccc ;
    var generator = RandomStringGenerator(
        minLength: 3,
        maxLength: 5,
        hasSymbols: false,
        alphaCase: AlphaCase.LOWERCASE_ONLY
    );

    final CollectionReference _codesCollectionRef = FirebaseFirestore.instance
        .collection("codes");


    Iterable.generate(1).forEach((_) {
      try {
        code = generator.generate();
        code2=generator.generate();
        //generate();
        print("ccc="+code);
      } on RandomStringGeneratorException catch (e) {
        print(e.message);
      }
    });

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {



      await Firestore.instance.collection('emp').add({
        'name': name,
        'email': email,
        'phone':phone,
        'code':name[0]+name[1]+code+phone[4]+password[4]+code2+x2.toString(),
        //name[0]+name[1]+code+phone[4]+password[4]+code2+x2.toString()+name[1],
        'coins':0,
         'nsba':10,
        'downloads':0,

      });
      });
      List<dynamic>jj=[
        name[0]+name[1]+code+phone[4]+password[4]+code2+x2.toString(),
      ];
      //code_model[0].codes.add(name[0]+name[1]+code+phone[4]+password[4]+code2+x2.toString());
      Firestore.instance.collection('codes').document('6lAe3U77kqUIL2EUQLHG').
      updateData({"code": FieldValue.arrayUnion(jj)});
      final box = GetStorage();

      box.write('sales_name', name);
      box.write('sales_email', email);

      Get.offAll(MainPage());
      // Get.offAll(
      //     SalesDetails(
      //       name: name,
      //       email: email,
      //     ));
      //    Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }


  void createAccountWithEmailAndPassword() async {
    final box = GetStorage();
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) async {
        final box1 = box.write('email', email);
        final box2 = box.write('pass', password);
        final box3 = box.write('name', name);
      });

      await Firestore.instance.collection('users').add({
        'name': name,
        'email': email,
      });
      Get.offAll(MainPage());

    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }



  void createAccountWithPhoneAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {});

      await Firestore.instance.collection('users').add({
        'name': name,
        'email': email,
      });
      final box = GetStorage();
      box.write('email', email);
      box.write('name', name);

      Get.offAll(MainPage());


    } catch (e) {
      Get.snackbar("Error login Acoount", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          print("ppp" + phoneAuthCredential.toString());
        },
        verificationFailed: (verificationFailed) async {
          print("ppp" + verificationFailed.toString());
        },
        codeSent: (verficationId, resendingToken) async {
          this.verificationId = verficationId;
          update();
          print("sss=" + verficationId);
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future sendCodeToFireBase(String code) async {
    if (this.verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Get.to(MainPage());
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            print("error");
          });
    }
  }

  void ResetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) {
        Get.to(MainPage());
        Get.snackbar('تم',
            'ارسلنا لك رابط علي الايميل تستطيع اعادة كلمة المرور من خلاله',
            backgroundColor: Colors.lightGreen,
            colorText: Colors.white,
            duration: Duration(seconds: 10));
      });
    } on FirebaseAuthException catch (e) {
      print("PPP" + e.code);
      print("eeee=" + e.message);

      Get.snackbar('!!!!!', 'تاكد من ان هذا الايميل صحيح و مسجل داخل  التطبيق ',
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
          duration: Duration(seconds: 10));
// show the snackbar here
    }
    //   _auth.sendPasswordResetEmail(email: email);
  }

  // Future<void> saveUser(UserCredential user) async {
  //   UserModel userModel = UserModel(
  //     user.user.uid,
  //     user.user.email,
  //     name == null ? user.user.displayName : name,
  //     " ",
  //   );
  //   await FireStoreUser().addUserToFireStore(userModel);
  //   setUser(userModel);
  // }

  // void setUser(UserModel userModel) async {
  //   await localStorageData.setUser(userModel);
  // }

  travelcode (num p,num discount,num x2, num shipping) {

    price=p * x2 + shipping;

    if(discount != null){

      price=price-((price*discount)/100);
    }

    // return price;
    update();

  }

  ownerSendRequest() async {
    if (name != "" &&
        email != "" &&
        country != "" &&
        city != null &&
        cat != "" &&
        mobile != "" &&
        details != "") {
      FirebaseFirestore.instance
          .collection('send_requests')
          .document()
          .setData({
        'brand_name': brand_name,
        'brand_email': email,
        'country': country,
        'city': city,
        'category': cat,
        'mobile': mobile,
        'details': details
      });

      Get.offAll(MainPage());

      Get.snackbar('تم ارسال طلبك بنجاح ',
          ' انتظر ردنا علي الايميل او هاتفك خلال الايام القادمة ',
          colorText: Colors.white, backgroundColor: Colors.deepOrange);
    } else {
      Get.snackbar(' خطا', 'تاكد من ادخال جميع البيانات بشكل صحيح',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
