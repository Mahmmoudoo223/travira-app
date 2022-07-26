import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/hotel&trips/details_view3.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchView extends StatefulWidget {
  String search_txt;
  SearchView({this.search_txt});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SearchView> {
  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    //final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: Dimentions.height5,
            ),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('services')
                      .where('city', isGreaterThanOrEqualTo: widget.search_txt)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return GridView.builder(
                            itemCount: snapshot.data.documents.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                              return GetBuilder<HomeViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => Container(
                                      height: 1400,
                                      child: InkWell(
                                        child: Card(
                                          color: Colors.white,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        Dimentions.Radius10),
                                                    topRight: Radius.circular(
                                                        Dimentions.Radius10),
                                                    bottomLeft: Radius.circular(
                                                        Dimentions.Radius10),
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
                                            height: Dimentions.height600,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: Dimentions.width230,
                                                  height: Dimentions.height130,
                                                  child: Image.network(
                                                      posts.data()['image'],
                                                      fit: BoxFit.fill),
                                                ),
                                                Column(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        width:
                                                            Dimentions.width100,
                                                        child: Text(
                                                          ("   " +
                                                              posts.data()[
                                                                  'name']),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Reboto"),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 2),
                                                    RatingBar(
                                                      ignoreGestures: true,
                                                      initialRating:
                                                          posts.data()['star'],
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 13,
                                                      maxRating: 5,
                                                      ratingWidget:
                                                          RatingWidget(
                                                        full: Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                        half: Icon(
                                                          Icons
                                                              .star_half_outlined,
                                                          color: Colors.yellow,
                                                        ),
                                                        empty: Icon(
                                                          Icons.star_border,
                                                          color: Colors.yellow,
                                                        ),
                                                      ),
                                                      //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     SizedBox(width:50,),
                                                    //     Text((posts.data()['price']).toString(),
                                                    //       style:TextStyle( color:Colors.lightBlue,fontSize:16,
                                                    //           fontWeight:FontWeight.bold),
                                                    //     ),
                                                    //     Text(("  LE"),
                                                    //       style:TextStyle( color:Colors.lightBlue,fontSize:16,
                                                    //           fontWeight:FontWeight.bold),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(DetailsView3(
                                            name: posts.data()['name'],
                                            details: posts.data()['des'],
                                            price: posts.data()['price'],
                                            image: posts.data()['image'],
                                            city: posts.data()['city'],
                                          ));
                                        },
                                      )));
                            });
                    }
                  }),
            ),
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
