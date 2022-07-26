
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'hotel&trips/details_view3.dart';

class AllhotelsAndTrips extends StatefulWidget {
  String city, trip;
  AllhotelsAndTrips({this.city, this.trip});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<AllhotelsAndTrips> {
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
          child: Column(children: [
            SizedBox(
              height: 7,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(widget.trip)
                      .where('city', isEqualTo: widget.city)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData == false ||
                        snapshot.data.docs.length == 0) {
                      return Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: Dimentions.height20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Dimentions.width25,
                              ),
                              Custom_Text(
                                text: "91".tr,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimentions.height20,
                          ),
                          Container(
                            height: 280,
                            child: Image.asset("assets/tra.jpg"),
                          ),
                        ],
                      ));
                    } else {
                      //  if (!snapshot.hasData) return Center(child: Text('Loading'));
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
                        default:
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                      snapshot.data.documents[index];
                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),
                                      builder: (controller) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                height: Dimentions
                                                    .pageViewContainer220,
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
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: Offset(0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: Dimentions
                                                                .width400,
                                                            height: Dimentions
                                                                .pageViewContainer144,
                                                            child: Image.network(
                                                                posts.data()[
                                                                        'image'] ??
                                                                    'https://s3.envato.com/files/277838614/AO9T8797.jpg',
                                                                fit: BoxFit
                                                                    .fill),
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
                                                                child:
                                                                    Container(
                                                                  //width:100,
                                                                  child: Text(
                                                                    (posts.data()[
                                                                        'hotel']),
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
                                                                height: 7,
                                                              ),
                                                              RatingBar(
                                                                ignoreGestures:
                                                                    true,
                                                                initialRating:
                                                                    posts.data()[
                                                                        'star'],
                                                                direction: Axis
                                                                    .horizontal,
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
                                                    Get.to(DetailsView3(
                                                      name:
                                                          posts.data()['hotel'],
                                                      price:
                                                          posts.data()['price'],
                                                      //      x:posts.data()['x'],
                                                      details: '',
                                                      // posts.data()['des'],
                                                      image:
                                                          posts.data()['image'],
                                                      city:
                                                          posts.data()['city'],
                                                      //link:posts.data()['link'],
                                                      //    brand:posts.data()['brand'],
                                                      //  brandemail:posts.data()['brandemail']
                                                    ));
                                                  },
                                                )),
                                          ));
                                }),
                          );
                      }
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

