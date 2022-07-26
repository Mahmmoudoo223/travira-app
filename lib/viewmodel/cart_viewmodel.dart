// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/model/cart_product_model.dart';
// import 'package:ecommerce/model/product_moidel.dart';
// import 'package:ecommerce/services/database/cart_database_helper2.dart';
// import 'package:ecommerce/view/cart/cart_view.dart';
// import 'package:ecommerce/view/home/controll_view.dart';
// import 'package:ecommerce/view/home/home_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class CartViewModel extends GetxController {
//   ValueNotifier<bool> get loading => _loading;
//
//   ValueNotifier<bool> _loading = ValueNotifier(false);
//
//   List<CartProductModel> _cartProductModel = [];
//
//   List<CartProductModel> get cartProductModel => _cartProductModel;
//
//   double get totalPrice => _totalPrice;
//
//
//
//   double _totalPrice = 0.0;
//   num total = 0.0;
//
//   int quant2 = 1;
//
//   var dbHelper = CartDatabaseHelper.db;
//   ProductModel  model;
//
//
//   @override
//   void onInit() {
//     // Here you can fetch you product from server
//     super.onInit();
//     getAllProduct();
//     update();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//     update();
//   }
//
//   @override
//   void onClose() {
//     getAllProduct().dispose();
//     // Here, you can dispose your StreamControllers
//     // you can cancel timers
//     super.onClose();
//     update();
//   }
//
//   CartViewModel() {
//     getAllProduct();
//     getTotalPrice();
//   }
//
//   getAllProduct() async {
//     update();
//     _loading.value = true;
//     _cartProductModel = await dbHelper.getAllProduct();
//     print('xxxxxxxxx=' + _cartProductModel.length.toString());
//     _loading.value = false;
//     getTotalPrice();
//     update();
//   }
//
//   addProduct2(CartProductModel cartProductModel, String productId) async {
//     // if (_cartProductModel.length == 0) {
//     //   var dbHelper = CartDatabaseHelper.db;
//     //   await dbHelper.insert(cartProductModel);
//     //   _cartProductModel.add(cartProductModel);
//     //    Get.snackbar('done', 'تم اضافة المنتج بنجاح',
//     //     snackPosition: SnackPosition.BOTTOM,
//     //     //backgroundColor: Colors.green,
//     //     colorText: Colors.black);
//     // }
//
//
//     if (_cartProductModel.length == 10) {
//       Get.snackbar('عفوا', "لا يمكن اضافة اكثر من 10 منتجات في كل طلب",
//        snackPosition: SnackPosition.BOTTOM,
//         //backgroundColor: Colors.white,
//         colorText: Colors.black);
//     }
//
//     // if (cartProductModel.brand != cartProductModel.brand ) {
//     //   Get.snackbar('عفوا', "لا يمكن اضافة ",
//     //       snackPosition: SnackPosition.BOTTOM,
//     //       //backgroundColor: Colors.white,
//     //       colorText: Colors.black);
//     // }
//
//
//     else {
//      // print("brannnnd="+cartProductModel.brand_email);
//       var dbHelper = CartDatabaseHelper.db;
//       await dbHelper.insert(cartProductModel);
//       print("done");
//      // Get.to(CartView2());
//        // Get.snackbar('done', 'تم اضافة المنتج بنجاح',
//        //  snackPosition: SnackPosition.BOTTOM,
//        //  //backgroundColor: Colors.green,
//        //  colorText: Colors.black);
//     }
//
//     _cartProductModel.add(cartProductModel);
//     _totalPrice +=
//         (double.parse(cartProductModel.price) * cartProductModel.quantity);
//     update();
//     getAllProduct();
//
//   }
//
//
//   dialogAndAdd(CartProductModel cartProductModel, String productId){
//
//     Get.defaultDialog(
//       title: "متاكد من الاضافة الي السلة  ",
//       middleText:"",
//       onConfirm:(){
//         addProduct2(cartProductModel,productId);
//         print("");
//         Get.back();
//         // Get.off(ControlView());
//       },
//
//       onCancel:(){
//         print("kk");
//       },
//       textCancel:"لا",
//       textConfirm:"نعم",
//       cancelTextColor:Colors.deepOrange,
//       buttonColor:Colors.lightBlue,
//       confirmTextColor:Colors.white,
//       barrierDismissible: true,
//       //middleText: "Hello world!",
//       backgroundColor: Colors.white,
//       titleStyle: TextStyle(color: Colors.lightBlue),
//       middleTextStyle: TextStyle(color: Colors.white),
//     );
//   }
//
//
//   dialogAndDelete(CartProductModel cartProductModel, String productId){
//
//     Get.defaultDialog(
//       title: "متاكد من مسح طلبك السابق ",
//       middleText:"",
//       onConfirm:(){
//         DeleteAll(cartProductModel);
//         addProduct2(cartProductModel,productId);
//         print("");
//         Get.back();
//        // Get.off(ControlView());
//       },
//
//       onCancel:(){
//         print("kk");
//       },
//       textCancel:"لا",
//       textConfirm:"نعم",
//       cancelTextColor:Colors.deepOrange,
//       buttonColor:Colors.red,
//
//       confirmTextColor:Colors.white,
//       barrierDismissible: true,
//       //middleText: "Hello world!",
//       backgroundColor: Colors.white,
//       titleStyle: TextStyle(color: Colors.green),
//       middleTextStyle: TextStyle(color: Colors.white),
//     );
//   }
//
//   DeleteProducts(CartProductModel cartProductModel, String productId) async {
//     var dbHelper = CartDatabaseHelper.db;
//     await dbHelper.Delete(cartProductModel);
//     print("delete Done");
//     _cartProductModel.add(cartProductModel);
//     _totalPrice = 0;
//     update();
//     getAllProduct();
//     final box = GetStorage();
//     box.remove('brand');
//     Get.snackbar('done', ' تم حذف المنتج بنجاح ',
//         snackPosition: SnackPosition.BOTTOM,
//         //backgroundColor: Colors.green,
//         colorText: Colors.black);
//   }
//
//    DeleteAll(CartProductModel cartProductModel)async{
//      var dbHelper = CartDatabaseHelper.db;
//      await dbHelper.DeleteAll(cartProductModel);
//      final box = GetStorage();
//      box.remove('brand');
//      print("delete Done");
//      update();
//    }
//   // addProduct(name, img, price, quant2, product_id) async {
//   //   final user = FirebaseAuth.instance.currentUser;
//   //   final userData =
//   //       FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//   //
//   //   FirebaseFirestore.instance.collection('Orders').document().setData({
//   //     'name': name,
//   //     'img': img,
//   //     'price': price,
//   //     'quantity': quant2,
//   //     'productId': product_id,
//   //     'total =': price * quant2,
//   //     'user': user.email.toString(),
//   //     //'time':now.toString(),
//   //   });
//   //   CartProductModel(name: name, image: img, quantity: quant2, price: price);
//   //
//   //   // _totalPrice=price*quant2;
//   //   // print(_totalPrice);
//   //   Get.snackbar('Done', 'Product Add Successfully',
//   //       colorText: Colors.white, backgroundColor: Colors.red);
//   //   // Get.offAll(HomeView());
//   // }
//
//   // getTotalPrice(){
//   //   FirebaseFirestore.instance.collection('Orders')
//   //       .snapshots();
//   // }
//
//   getTotalPrice() {
//     _totalPrice = 0.0;
//     for (int i = 0; i < _cartProductModel.length; i++) {
//       // _totalPrice=0.0;
//       _totalPrice = _totalPrice +
//           (double.parse(_cartProductModel[i].price) *
//               _cartProductModel[i].quantity);
//       print('t=' + _totalPrice.toString());
//       update();
//     }
//   }
//
//   increaseQuantity(int index) async {
//     if (_cartProductModel[index].quantity <= 10) {
//       _cartProductModel[index].quantity++;
//       _totalPrice += (double.parse(_cartProductModel[index].price));
//       dbHelper.updateProduct(_cartProductModel[index]);
//
//       update();
//       getTotalPrice();
//     } else {
//       Get.snackbar('sorry', 'max number of products is 10',
//           colorText: Colors.red);
//     }
//   }
//
//   decreaseQuantity(int index) async {
//     if (_cartProductModel[index].quantity > 1) {
//       _cartProductModel[index].quantity--;
//       _totalPrice -= (double.parse(_cartProductModel[index].price));
//       dbHelper.updateProduct(_cartProductModel[index]);
//       update();
//       getTotalPrice();
//     } else {
//       print("very small num");
//     }
//   }
// }
