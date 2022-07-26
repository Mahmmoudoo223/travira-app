


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  const CustomButton({
    this.text,
    this.onPressed
  });


   @override
   Widget build(BuildContext context) {
     return  FlatButton(
         shape:RoundedRectangleBorder(
           borderRadius:BorderRadius.circular(20),

         ),
         padding:EdgeInsets.all(18),
         color: Colors.yellow,
         onPressed:onPressed,
         child:Custom_Text(
           text:text,
           fontSize:19,
           alignment:Alignment.center,
           color: Colors.black,
         ));
   }
 }
