
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
      //  overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: SizedBox(
                height: 46,
                width: 46,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.white,
                  onPressed: () {},
                  child: SvgPicture.asset("assets/Camera Icon.svg"),
                )),
          )
        ],
      ),
    );
  }
}
