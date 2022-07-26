import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/booking/booking_form.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView3 extends StatefulWidget {
  String name;
  String city;
  String details;
  int price;
  String image;
  // String  link;
//  String video;

  DetailsView3({
    this.name,
    this.image,
    this.price,
    this.city,
    this.details,
    //this.link,
    //  this.video
  });

  @override
  State<DetailsView3> createState() => _DetailsView2State();
}

class _DetailsView2State extends State<DetailsView3> {
  int index = 0;

  String lg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 0),

            Container(
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.Radius40),
                        topRight: Radius.circular(Dimentions.Radius40),
                        bottomLeft: Radius.circular(Dimentions.Radius40),
                        bottomRight: Radius.circular(Dimentions.Radius40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimentions.Radius30),
                    child: Image.network(widget.image, fit: BoxFit.cover))),

            // SizedBox(height: 15),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(17),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Custom_Text(
                              text: widget.name.toString(),
                              fontSize: 22,
                              color: Colors.black),
                          SizedBox(width: Dimentions.width50),
                          Custom_Text(
                            text: '76'.tr + " " + widget.city + " ",
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      //  SizedBox(height: 15),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      Row(
                        children: [
                          Custom_Text(
                            text: '40'.tr,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 110,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: Dimentions.height20,
                      ),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(widget.details,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(widget.price.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: Dimentions.ViewContainer56,
                width: double.infinity,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimentions.Radius20)),
                    color: Colors.yellow,
                    onPressed: () {
                      Get.to(BookingForm(
                        city: widget.city,
                        trip: widget.name,
                        price: widget.price,
                      ));
                    },
                    child: Text(
                      "42".tr,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Reboto"),
                    )),
              ),
            ),
            Container(height: Dimentions.height30),
          ],
        ),
      ),
    );
  }

  Future<void> launchVideo(String url) async {
    try {
      canLaunch(url);
      await launch(url, enableJavaScript: true, forceWebView: false);
    } catch (e) {
      print("e=" + e.toString());
    }
  }

  Future<void> launchServices(String url) async {
    try {
      canLaunch(url);
      await launch(url,
          enableJavaScript: true,
          forceWebView: false,
          webOnlyWindowName: "prmga club");
    } catch (e) {
      print("e=" + e.toString());
    }
  }
}
