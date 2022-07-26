import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyLoacleController extends GetxController {
  // Locale intialLang

  void ChangeLang(String codelang) {
    Locale locale = Locale(codelang);
    final box = GetStorage();
    Get.updateLocale(locale);
    box.write("lang", codelang);
  }
}
//sharepref.getString("lang")=="ar"? Locale("ar") : Locale("en");
