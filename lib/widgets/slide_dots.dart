import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 7.3,vertical: 50.0),
      height: isActive ? 12 : 9,
      width: isActive ? 12 : 9,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.grey,
        border: isActive ?  Border.all(color: Color(0xff927DFF),width: 2.0,) : Border.all(color: Colors.transparent,width: 1,),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
