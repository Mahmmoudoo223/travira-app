

import 'package:ecommerce/view/cities_view.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_view_model.dart';


class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigotorValue => _navigatorValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;



  @override
  void onInit() {

    Get.put(HomeViewModel());
    _currentScreen = HomeView();
    print('onitttt');
   // intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
   //     listener:(AdmobAdEvent event , Map<String, dynamic> args ){
   //       if(event==AdmobAdEvent.closed) intersitialAd.load();
   //     } );
   // intersitialAd.load();
    // Here you can fetch you product from server
    super.onInit();
    update();
  }



  @override
  void onReady() {
    print("ready");
    _currentScreen = HomeView();
    super.onReady();
  }


  @override
  void onClose() {
    print("close");
    _currentScreen = HomeView();
    super.onClose();
  }



  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;

    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }

      case 1:
        {
          Get.to(AllCities());
          //intersitialAd.show();
          //Get.to(CategoryView()); // SaveOrder('x');
          break;
        }

      case 2:
        {
           // Get.to(NewScreen());
// out: GetX is the best
       //   Get.to(CartView2()); // SaveOrder('x');
          break;
          // _currentScreen = ProfileView();

        }

      // case 3:
      //   {
      //     //  _currentScreen = CartView2();
      //     // Get.to(MapView());
      //     // _currentScreen = CartView2();
      //     Get.to(OwnerCodeView()); // SaveOrder('x');
      //     break;
      //   }

      // case 3:
      //   {
      //    // intersitialAd.show();
      //     Get.to(PromoCode());
      //     break;
      //   }
    }
    update();
  }
}
