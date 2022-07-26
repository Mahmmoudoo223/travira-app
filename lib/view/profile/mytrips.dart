import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myTrips extends StatefulWidget {
  String email;

  myTrips({this.email});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<myTrips> {
  String allposts;
  String v;
  Future resultsLoaded;

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();


  @override
  initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.yellow,
          iconTheme: IconThemeData(
            color: Colors.yellow,
          ),
        ),

        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(
              height: Dimentions.height36,
            ),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
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
                              return
                                // GetBuilder<HomeViewModel>(
                                //   init: Get.find(),
                                //   builder: (controller) =>

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height:830,
                                            child: InkWell(
                                              child: Card(
                                                  color: Colors.white,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    Dimentions
                                                                        .height10),
                                                            topRight:
                                                                Radius.circular(
                                                                    Dimentions
                                                                        .height10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    Dimentions
                                                                        .height10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    Dimentions
                                                                        .height10)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ]),
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: Dimentions
                                                                .width400,
                                                            height: Dimentions
                                                                .height160,
                                                            child: Image.asset(
                                                                "assets/pex3.jpg",
                                                                fit: BoxFit
                                                                    .fill),
                                                          ),
                                                          SizedBox(
                                                              height: Dimentions
                                                                  .height20),
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: Dimentions
                                                                        .width40,
                                                                  ),
                                                                  Text(
                                                                    ("77".tr),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()['trip'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Container(
                                                                //width:100,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Dimentions
                                                                          .width40,
                                                                    ),
                                                                    Text(
                                                                      ("78".tr ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                    //  SizedBox(width: 11,),
                                                                    Text(
                                                                      (posts.data()[
                                                                              'to'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Container(
                                                                //width:100,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Dimentions
                                                                          .width40,
                                                                    ),
                                                                    Text(
                                                                      ("79".tr ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                    //  SizedBox(width: 11,),
                                                                    Text(
                                                                      (posts.data()[
                                                                              'from'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Container(
                                                                //width:100,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Dimentions
                                                                          .width40,
                                                                    ),
                                                                    Text(
                                                                      ("80".tr ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                    //  SizedBox(width: 11,),
                                                                    Text(
                                                                      (posts.data()[
                                                                              'type'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Container(
                                                                //width:100,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Dimentions
                                                                          .width40,
                                                                    ),
                                                                    Text(
                                                                      ("81".tr),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                    //  SizedBox(width: 11,),
                                                                    Text(
                                                                      (posts.data()[
                                                                          'num']),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: Dimentions
                                                                        .width40,
                                                                  ),
                                                                  Text(
                                                                    ("82".tr ??
                                                                        ""),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'name'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: Dimentions
                                                                        .width40,
                                                                  ),
                                                                  Text(
                                                                    ("83".tr ??
                                                                        ""),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'email'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: Dimentions
                                                                        .width40,
                                                                  ),
                                                                  Text(
                                                                    ("84".tr ??
                                                                        ""),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'status'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                      width: Dimentions
                                                                          .width40),
                                                                  Text(
                                                                    ('85'.tr),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'point'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                      width: Dimentions
                                                                          .width40),
                                                                  Text(
                                                                    ('88'.tr),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'date'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                      width: Dimentions
                                                                          .width40),
                                                                  Text(
                                                                    ('89'.tr),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'time'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Dimentions
                                                                        .height5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                      width: Dimentions
                                                                          .width40),
                                                                  Text(
                                                                    ('90'.tr),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  Container(
                                                                    //width:100,
                                                                    child: Text(
                                                                      (posts.data()[
                                                                              'point'] ??
                                                                          ""),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Reboto"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: Dimentions
                                                                    .height25,
                                                              ),
                                                              Container(
                                                                //width:100,
                                                                child: Text(
                                                                  ('87'.tr +
                                                                          posts.data()[
                                                                              'total'] ??
                                                                      ""),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          "Reboto"),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: Dimentions
                                                                      .height30),
                                                              RaisedButton(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(Dimentions.Radius5)),
                                                                  color: Colors
                                                                      .yellow,
                                                                  child: Text(
                                                                    "96".tr,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            21,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            "Reboto"),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Get.offAll(
                                                                        MainPage());
                                                                  })
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              onTap: () {},
                                            )),
                                      );


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
