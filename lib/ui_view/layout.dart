import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homam/constants/constants.dart';
import 'package:homam/model/slider.dart';
import 'package:homam/ui_view/about.dart';

import 'package:homam/ui_view/slider_layout_view.dart';
import 'package:homam/widgets/slide_dots.dart';
import 'package:homam/widgets/slide_items/slide_item.dart';
class LayoutScreen extends StatefulWidget {
  @override
  late bool isActive;

  LayoutScreen(bool isActive);
  State<StatefulWidget> createState() => _LayoutState();
}



class _LayoutState extends State<LayoutScreen> {
   final int index = 0;
   PageController _controller = PageController(initialPage: 0, keepPage: false);






  @override
  Widget build(BuildContext context) {
    Flexible(child :
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image : AssetImage(sliderArrayList[index].sliderImageUrl,

          ),

          fit: BoxFit.fitWidth,

        ),
      ),





      child : Text(

        sliderArrayList[index].sliderHeading,
        style: TextStyle(
          fontFamily: Constants.LORA,
          fontWeight: FontWeight.w700,
          fontSize: 40.0,

        ),
        textAlign: TextAlign.center,

      ),
    ),
    );
    Container(
    child : Center(
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 40.0),
    child: Text(
    sliderArrayList[index].sliderSubHeading,
    style: TextStyle(
    fontFamily: Constants.ALLISON,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    fontSize: 50.0,
    ),
    textAlign: TextAlign.center,

    ),
    ),
    ),
    );

    return Container(


      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[


              Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[


                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () {

                          _controller.animateToPage(3, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                          // or this to jump to it without animating
                          _controller.jumpToPage(3);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<
                              Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                              return Colors.transparent; // Use the component's default.
                            },
                          ),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: Colors.white.withOpacity(0.05))
                            ),
                          ),

                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: Constants.LORA,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),

                        // This trailing comma makes auto-formatting nicer for build methods.
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0, right: 20.0),
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<
                              Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                              return Colors.transparent; // Use the component's default.
                            },
                          ),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: Colors.white.withOpacity(0.05))
                            ),
                          ),

                        ),
                        child: const Text(
                          'About',
                          style: TextStyle(
                            fontFamily: Constants.LORA,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),

                        // This trailing comma makes auto-formatting nicer for build methods.
                      ),
                    ),
                  ),



                ],
              )
            ],
          )),
    );
  }


}