import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesDetails extends StatefulWidget {
  String name, email;
  SalesDetails({this.name, this.email});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SalesDetails> {
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
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              height: Dimentions.ViewContainer30,
              child: Center(
                  child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.62),
                  SizedBox(width: Dimentions.width5),
                ],
              ))),
        ),
        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(
              height: Dimentions.height15,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('emp')
                      .where('email', isEqualTo: widget.email)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                              return GetBuilder<HomeViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.ltr,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Custom_Text(
                                                      text: "Travira Marketing",
                                                      fontSize: 25,
                                                      color: Colors.black45,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: Dimentions.height10),
                                            Container(
                                                height: Dimentions
                                                    .pageViewContainer310,
                                                child: InkWell(
                                                  child: Card(
                                                    color: Colors.white,
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                              height: Dimentions
                                                                  .height10),
                                                          Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Directionality(
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          ("Name : "
                                                                              .tr),
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              Dimentions.height10),
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          (posts.data()['name'] ??
                                                                              ""),
                                                                          style: TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: Dimentions
                                                                      .height10),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Directionality(
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          ("code : "),
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              Dimentions.width5),
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          (posts.data()['code'] ??
                                                                              ""),
                                                                          style: TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: Dimentions
                                                                            .width5,
                                                                      ),
                                                                      Spacer(),
                                                                      InkWell(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              Dimentions.width50,
                                                                          height:
                                                                              Dimentions.height50,
                                                                          child:
                                                                              Center(child: Image.asset("assets/copy2.jpg")),
                                                                        ),
                                                                        onTap:
                                                                            () {
                                                                          FlutterClipboard.copy(posts.data()['code']).then((value) =>
                                                                              print('copied'));
                                                                          Get.snackbar(
                                                                            'Done',
                                                                            'Code Copied',
                                                                            backgroundColor:
                                                                                Colors.lightGreen,
                                                                            colorText:
                                                                                Colors.white,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: Dimentions
                                                                      .height5),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Directionality(
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          ("earnings : "),
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              Dimentions.width10),
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          (posts.data()['coins'] ?? "")
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: Dimentions
                                                                    .height15,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Directionality(
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          ("customers: "),
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              Dimentions.width10),
                                                                      Container(
                                                                        //width:100,
                                                                        child:
                                                                            Text(
                                                                          (posts.data()['downloads']).toString() ??
                                                                              "0",
                                                                          style: TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Reboto"),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {},
                                                )),
                                            RaisedButton(
                                                color: Colors.yellow,
                                                child: Text(
                                                  "105".tr,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                                onPressed: () {
                                                  Get.put(HomeViewModel());
                                                  Get.to(MainPage());
                                                })
                                          ],
                                        ),
                                      ));
                            });
                    }
                  }),
            ),
            //),
            //  ]),
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

