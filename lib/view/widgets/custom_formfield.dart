

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

import 'custom_text.dart';

class CustomFormField extends StatefulWidget {

  final String text;
  final String hint;
  final Function onSave;
  final Function validator;
  final TextEditingController controller;
  final Color color;
  bool obx;
  CustomFormField({this.text,
    this.hint,
    this.onSave,
    this.controller,
    this.obx,
    this.validator,
    this.color,
  }
      ) ;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
        child:  Column(
            children:[
              // Custom_Text(
              //     text:text,fontSize: 14,color:Colors.grey[600]
              // ),

              if(widget.obx==false)
              TextFormField(
                onSaved: widget.onSave,
                validator:widget.validator ,
                controller: widget.controller,
                // textAlign:TextAlign.end,
                decoration: InputDecoration(
                  hintText:widget.hint,
                  hintStyle: TextStyle(color:Colors.grey),
                  fillColor:Colors.white,
                ),
              ),

              if(widget.obx==true)
                TextFormField(
                  onSaved: widget.onSave,
                  validator:widget.validator ,
                  controller: widget.controller,
                  // textAlign:TextAlign.end,
                  decoration: InputDecoration(
                    hintText:widget.hint,
                    hintStyle: TextStyle(color:Colors.grey),
                    fillColor:Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        widget.obx ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obx= !widget.obx;
                        });
                      },
                    ),
                  ),
                ),

            ]
        )
    );
  }
}
