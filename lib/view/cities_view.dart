
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/category/Allcat.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCities extends StatefulWidget {
  String city;

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<AllCities> {
  String allposts;
  String v;
  Future resultsLoaded;
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
              height: Dimentions.height7,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('cities')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                              itemCount: snapshot.data.documents.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot posts =
                                    snapshot.data.documents[index];
                                return GetBuilder<HomeViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: InkWell(
                                            child: Container(
                                              // width: 230,
                                              height: 300,
                                              // Dimentions
                                              //     .pageViewContainer280,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          Dimentions.Radius12),
                                                      topRight: Radius.circular(
                                                          Dimentions.Radius12),
                                                      bottomLeft:
                                                          Radius.circular(
                                                              Dimentions
                                                                  .Radius12),
                                                      bottomRight:
                                                          Radius.circular(
                                                              Dimentions
                                                                  .Radius12)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 4,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:230,
                                                    // Dimentions
                                                    //     .pageViewContainer220,
                                                    child: Image.network(
                                                        posts.data()['image'],
                                                        fit: BoxFit.fill),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Get.to(AllCat(
                                                  city: posts.data()['name']));
                                            },
                                          ),
                                        ));
                              }),
                        );
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
