
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'details_view2.dart';

class HotelsView extends StatefulWidget {
  String cat;

  HotelsView({this.cat});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<HotelsView> {
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
        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(
              height: Dimentions.height7,
            ),

            SizedBox(
              height: Dimentions.height7,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('hotels') //.where('cat',isEqualTo:widget.cat)
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
                                        child: Container(
                                            height:
                                                Dimentions.pageViewContainer220,
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
                                                                      .Radius10),
                                                          topRight:
                                                              Radius.circular(
                                                                  Dimentions
                                                                      .Radius10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  Dimentions
                                                                      .Radius10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  Dimentions
                                                                      .Radius10)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width:
                                                            Dimentions.width420,
                                                        height: Dimentions
                                                            .ViewContainer140,
                                                        child: Image.network(
                                                            posts.data()[
                                                                'image'],
                                                            fit: BoxFit.fill),
                                                      ),
                                                      SizedBox(
                                                          height: Dimentions
                                                              .height10),
                                                      Column(
                                                        children: [
                                                          Directionality(
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            child: Container(
                                                              //    width:100,
                                                              child: Text(
                                                                (posts.data()[
                                                                    'name']),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        "Reboto"),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Dimentions
                                                                .height7,
                                                          ),
                                                          RatingBar(
                                                            ignoreGestures:
                                                                true,
                                                            initialRating: posts
                                                                .data()['star'],
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            itemSize: 18,
                                                            maxRating: 5,
                                                            ratingWidget:
                                                                RatingWidget(
                                                              full: Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              half: Icon(
                                                                Icons
                                                                    .star_half_outlined,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              empty: Icon(
                                                                Icons
                                                                    .star_border,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                            ),
                                                            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Get.to(DetailsView2(
                                                  name: posts.data()['name'],
                                                  details: posts.data()['des'],
                                                  image: posts.data()['image'],
                                                  price: posts.data()['price'],
                                                  city: posts.data()['city'],
                                                ));
                                              },
                                            )),
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
