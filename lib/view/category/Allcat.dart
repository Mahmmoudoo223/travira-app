
import 'package:ecommerce/view/hotels&trips_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCat extends StatefulWidget {
  String city;
  AllCat({this.city});
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<AllCat> {
  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.yellow,
          elevation: 0,

        ),
        body: Container(
          color: Colors.white38,
          child: ListView(

              children: [

                SizedBox(
                  height: 7,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        child: Card(
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [

                                Container(
                                    width: 330,
                                    height: 160,
                                    child: Image.asset('assets/sum1.jpg',
                                        fit: BoxFit.fill)),

                                SizedBox(height: 3),

                                Container(
                                  child: Text(
                                    '92'.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(
                              AllhotelsAndTrips(
                            city: widget.city,
                            trip: 'trips1',
                          ));
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        child: Card(
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                //  SizedBox(height:3,),

                                Container(
                                    width: 330,
                                    height: 160,
                                    child: Image.asset('assets/sum2.jpg',
                                        fit: BoxFit.fill)),

                                SizedBox(height: 3),

                                Container(
                                  child: Text(
                                    '93'.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(AllhotelsAndTrips(
                            city: widget.city,
                            trip: 'trips2',
                          ));
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        child: Card(
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                //  SizedBox(height:3,),

                                Container(
                                    width: 330,
                                    height: 160,
                                    child: Image.asset(
                                      'assets/sum3.png',
                                      fit: BoxFit.fill,
                                    )),

                                SizedBox(height: 3),

                                Text(
                                  '94'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(AllhotelsAndTrips(
                            city: widget.city,
                            trip: 'trips3',
                          ));
                        },
                      )),
                )
              ]),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }

