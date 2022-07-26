



import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/pay_mob/constants/const.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


 class VisaCard extends StatelessWidget {
   String name,email,phone,code,d_app,from,point,to,trip,nsba_offer,num,status,total;


VisaCard({
     this.name,
     this.email,
     this.phone,
     this.code,
     this.d_app,
     this.from,
     this.point,
     this.to,
     this.trip,
     this.nsba_offer,
     this.num,
     this.status,
     this.total
   });


  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller =
    Completer<WebViewController>();
    return Scaffold(
      appBar:AppBar(
        actions: [

        ],
      ),
      body: WebView(
        initialUrl:
        'https://accept.paymob.com/api/acceptance/iframes/422698?payment_token=$FinalTokenCard',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {

          if (request.url.startsWith('https://accept.paymobsolutions.com/api/acceptance/post_pay')) {
            print('yesssssssssssssss');
            new Future.delayed(new Duration(seconds: 33), () async {
              print("xxxx");
              await Firestore.instance.collection('orders').add({
                'name': name ?? "",
                'email': email ?? "",
                'phone': phone ?? "",
                'code': code?? "",
                'type':'Card',
                'd_app': d_app ?? "",
                'from': from,
                'point': "it will be updated soon",
                'to': to,
                'trip': trip,
                // 'price':widget.price.toString(),
                'nsba_offer': nsba_offer,
                'num': num.toString(),
                "status": "pending",
                "total": total,
                "date": "Waiting..",
                "time": "Waiting..",
                "bus":"Waiting.."
              });
              Get.off(MainPage());

            });
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),
     // floatingActionButton: favoriteButton(),

    );

  }
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
