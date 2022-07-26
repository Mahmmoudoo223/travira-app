
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';



class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final String  title;
  final double  l;
  final double  r;
  final int  length;
  final GlobalKey<ScaffoldState> scaffoldKey ;

  CustomAppBar2({
     this.child,
    this.height = kToolbarHeight,
    this.title,
    this.l,
    this.r,
    this.length,
    this.scaffoldKey
  });

  @override
  Size get preferredSize => Size.fromHeight(height);




  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    int product_list=box.read('length')??0;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double height =139;
    String _searchKey = "";
    List<dynamic> _productList = [];
    TextEditingController _searchController=TextEditingController();

    return
      Padding(
        padding: const EdgeInsets.only(top:12.0),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.only(
              bottomLeft:   Radius.circular(20.0),
              bottomRight:Radius.circular(20.0),
            ),
          ),
          //  color:Colors.red[700],
          child: Padding(
            padding: const EdgeInsets.only(left:13.0,right:13.0),
            child: Column(

              children: [
                SizedBox(
                    height:29
                ),
                Container(

                  //   width:MediaQuery.of(context).size.width * 0.80,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width:8),
                      InkWell(
                        child: SvgPicture.asset(
                          'assets/Vector.svg',

                        ),
                        onTap:(){

                          scaffoldKey.currentState.openDrawer();
                          //openDrawer();
                        },
                      ),
                      SizedBox(width:12),
                      Text(title,style:TextStyle(color:Colors.white,
                          fontSize:16,fontWeight:FontWeight.w600),),

                      SizedBox ( width:MediaQuery.of(context).size.width/2.23),



                    ],
                  ),
                ),
                SizedBox(
                    height:9
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 7,left:9),
                      child: Stack(
                        children: [
                          Container(
                              height:42,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 0.1,
                                    blurRadius: 1,
                                    //   offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                              child:Container(
                                width: MediaQuery.of(context).size.width*0.87,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.6),
                                      spreadRadius: 0.1,
                                      blurRadius: 1,
                                      //   offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _searchController,
                                  decoration:  InputDecoration(
                                    hintText: "search",//AppLocalizations.of(context)!.searchForProducts,
                                    hintStyle: TextStyle(color: Colors.grey[300],
                                        fontSize:17),

                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 3, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 3, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    //labelText: 'Search',
                                  ),

                                  onFieldSubmitted: (txt) {
                                    _searchKey = txt;
                                    // setState(() {});

                                  },
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (String value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              )
                          ),

                          Positioned(
                              right:r,
                              top:12,
                              child: InkWell(
                                child: SvgPicture.asset(
                                  'assets/Search.svg',
                                ),
                                onTap:(){
                                  print("kkk"+_searchController.text.toString());


                                },
                              ))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}