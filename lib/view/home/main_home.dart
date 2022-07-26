import 'package:ecommerce/view/cities_view.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:ecommerce/view/home/profile/profile_screen.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPgeState();
}

class _MainPgeState extends State<MainPage> {
  int index = 0;
  final Screens = [
    HomeView(),
    AllCities(),
    //  SearchPage(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    Get.put(HomeViewModel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: GNav(
        activeColor: Colors.black,
        tabBackgroundColor: Colors.yellow.shade400,
        selectedIndex: index,
        onTabChange: (index) => setState(() => this.index = index),
        tabs: const [
          GButton(
            icon: Icons.home,
            // text: "60".tr,
          ),
          GButton(
            icon: Icons.bar_chart_sharp,
            //text: "City",
          ),
          GButton(
            icon: Icons.person,
            // text: "my ",
          ),
        ],
      ),
    );
  }
}
