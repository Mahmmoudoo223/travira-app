// import 'package:admob_flutter/admob_flutter.dart';
// import 'package:ecommerce/view/home/controll_view.dart';
// import 'package:ecommerce/view/home/promo_code.dart';
// import 'package:ecommerce/view/hotel&trips/all_trips.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math show pi;
// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// class SidebarPage extends StatefulWidget {
//   @override
//   _SidebarPageState createState() => _SidebarPageState();
// }
// class _SidebarPageState extends State<SidebarPage> {
//   List<CollapsibleItem> _items;
//   String _headline;
//   AssetImage _avatarImg =
//   AssetImage('assets/sora.jpg');

//   AdmobBannerSize bannerSize;
//   AdmobInterstitial intersitialAd;

//   @override
//   void initState() {
//     super.initState();
//     // intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
//     //     listener:(AdmobAdEvent event , Map<String, dynamic> args ){
//     //       if(event==AdmobAdEvent.closed) intersitialAd.load();
//     //     } );
//     // intersitialAd.load();
//     _items = _generateItems;
//     _headline = _items.firstWhere((item) => item.isSelected).text;
//   }

//   List<CollapsibleItem> get _generateItems {
//     return [
//       CollapsibleItem(
//           text: 'الرئيسية',
//           isSelected: true,
//           icon: Icons.home,
//           onPressed: ()
//           {
//              Get.offAll(ControlView());
//           }
//       ),


//       // CollapsibleItem(
//       //     text: ' المتاجر ',
//       //     icon: Icons.shop_outlined,
//       //     onPressed: ()  async {
//       //       Get.to(PostsScreen());
//       //      // Get.to(BrandsView());
//       //
//       //     }
//       // ),

//       CollapsibleItem(
//           text: ' جميع الخدمات  ',
//           icon: Icons.note,
//           onPressed: ()  async {

//             intersitialAd.load();
//             Get.to(AllTrips());
//           }),

//       CollapsibleItem(
//           text: 'كود الخصم   ',
//           icon: Icons.code,
//           onPressed: ()  async {
//             Get.to(  PromoCode());
//           }),



//       CollapsibleItem(
//           text: '  Prmga Club Channel  ',
//           icon: Icons.video_library,
//           onPressed: ()  async {

//             launchServices('https://www.youtube.com/channel/UCRg2xicI1dUUWBq7XmLHgrg?');

//           }
//       ),

//       CollapsibleItem(
//           text: '  طلب خدمات واستفسارات  ',
//           icon: Icons.star,
//           onPressed: ()  async {




//           }
//       ),

//       CollapsibleItem(
//           text: 'facebook  انضم   معنا  ',
//           icon: Icons.facebook,
//           onPressed: ()  async {

//             launchServices('https://www.facebook.com/groups/3143262605953731/?ref=share');


//           }
//       ),







//       // CollapsibleItem(
//       //     text: ' تغير الدولة  ',
//       //     icon: Icons.map,
//       //     onPressed: ()  async {
//       //
//       //       Get.to(ChangeCountry());
//       //
//       //     }
//       // ),




//       // CollapsibleItem(
//       //     text: 'تسجيل خروج ',
//       //     icon: Icons.logout,
//       //     onPressed: ()   {
//       //         signOut();
//       //     }
//       // ),

//     ];
//   }

//   // Future<void> signOut() async {
//   //   final LocalStorageData localStorageData = Get.find();
//   //   final box = GetStorage();
//   //   box.remove('country');
//   //   FirebaseAuth.instance.signOut();
//   //   localStorageData.deleteUser();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: CollapsibleSidebar(
//         items: _items,
//         avatarImg: _avatarImg,
//         title: '',
//         toggleTitle: "Prmga Club",
//         body: Container(),
//       //  backgroundColor:  Colors.white,

//         selectedTextColor: Colors.white,
//         selectedIconBox:Colors.transparent,
//         sidebarBoxShadow: [
//           BoxShadow(
//          color: Colors.white,
//             blurRadius: 5,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//         ],
//        // isCollapsed: false,
//         textStyle: TextStyle(color:Colors.black,fontSize: 15,
//             fontStyle: FontStyle.italic),
//         titleStyle: TextStyle(
//             fontSize: 20,
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.bold),
//         toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//   Future<void> launchServices(String url) async {
//     try {
//       canLaunch(url);
//       await launch(url,enableJavaScript:true,forceWebView:false,webOnlyWindowName: "prmga club");

//     }
//     catch(e){
//       print("e="+e.toString());
//     }
//   }

// /* Widget _body(Size size, BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       color: Colors.lightBlueGrey[50],
//       child: Center(
//         child: Transform.rotate(
//           angle: math.pi / 2,
//           child: Transform.translate(
//             offset: Offset(-size.height * 0.3, -size.width * 0.23),
//             child: Text(
//               _headline,
//               style: Theme.of(context).textTheme.headline1,
//               overflow: TextOverflow.visible,
//               softWrap: false,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   */
// }
// // class getCustomAppBar extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //       PreferredSize( preferredSize: Size.fromHeight(50),
// //           child:Container(
// //             decoration:BoxDecoration(
// //                 gradient: LinearGradient(
// //
// //                 )
// //             ),
// //           )
// //
// //
// //       );
// //   }
// //
// // }