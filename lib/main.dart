import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/locale/locale.dart';
import 'package:ecommerce/locale/locale_controller.dart';
import 'package:ecommerce/pay_mob/network/dio.dart';
import 'package:ecommerce/sales/sales_details.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/codes_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/employee_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'helper/binding.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut(() => AuthViewModel(), fenix: true);
  Get.lazyPut(() => ControlViewModel());
  Get.lazyPut(() => CodesViewModel(), fenix: true);
  Get.lazyPut(() => EmployeeViewModel(), fenix: true);
  Get.lazyPut(() => HomeViewModel());
  Get.put(MyLoacleController());
  await GetStorage.init();
  //await DioHelperPayment.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyLoacleController controllerLang = Get.find();

  @override
  void initState() {
    super.initState();
    new Future.delayed(new Duration(seconds: 4), () {
      print("xxxx");
      final box = GetStorage();
      String user = box.read("email") ?? 'x';
      String sales = box.read("sales_name") ?? 'w';
      String sales2 = box.read("sales_email") ?? 'w';
      String lang = box.read("lang") ?? 'x';

      if (lang == "en") {
        controllerLang.ChangeLang("en");
      }
      if (lang == "ar") {
        controllerLang.ChangeLang("ar");
      }

      if (user == 'x') {
        print("user=" + user.toString());
        Get.off(LoginView());
      }

      if (user != 'x' && sales == 'w') {
        Get.off(MainPage());
      }

      if (sales2 != 'w') {
        print("sales=" + sales.toString());
        Get.off(MainPage());
        // Get.off(SalesDetails(
        //   name: sales,
        //   email: sales2,
        // ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MyLoacleController());
    return GetMaterialApp(
        locale: Get.deviceLocale,
        translations: MyLocale(),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: Colors.yellow,
              iconTheme: IconThemeData(
                color: Colors.yellow,
              ),
            ),
            backgroundColor: Colors.white,
            //HexColor("#0B315e"),
            body: AnimatedSplashScreen(
                splash: Lottie.asset("assets/spl2.json"),

                // Column(
                //   children: [
                //     Container(
                //       height: 140,
                //         width: 240,
                //         child: Image.asset('assets/tra.png')),
                //     SizedBox(
                //       height:10
                //     ),
                //     Text("Travira",style:TextStyle(
                //       fontSize:29,color:Colors.black,fontWeight:FontWeight.bold
                //     ),)
                //   ],
                // ),
                nextScreen: MainPage(),
                splashIconSize: 250,
                duration: 7000,
                animationDuration: Duration(seconds: 1),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.white,
                pageTransitionType: PageTransitionType.fade)));
  }
}
//mvvm ----> model View viewModel

