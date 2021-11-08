import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homam/constants/constants.dart';
import 'package:homam/forms/form.dart';
import 'package:homam/forms/volunteer.dart';
import 'package:homam/model/slider.dart';

import 'package:homam/ui_view/slider_layout_view.dart';
import 'package:homam/widgets/slide_dots.dart';
import 'package:homam/widgets/slide_items/slide_item.dart';
import 'package:homam/forms/form.dart';

class StartScreen extends StatefulWidget {
  @override
  late bool isActive;

  StartScreen(bool isActive);
  State<StatefulWidget> createState() => StartScreenLayout();
}



class StartScreenLayout extends State<StartScreen> {

  Future navigateToFormLayout(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
  void navigateToVolunteerLayout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Volunteer()));
  }





  @override
  Widget build(BuildContext context) {
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
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 80.0),
                      child : SizedBox(
                        height : 65,
                      width : 140,
                      child: ElevatedButton(
                        onPressed: () {
                          navigateToFormLayout(context);
                        },
                        style: ButtonStyle(

                          backgroundColor: MaterialStateProperty.resolveWith<
                              Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                              return Colors.transparent; // Use the component's default.
                            },
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: Colors.white.withOpacity(0.0))
                            ),
                          ),

                        ),
                        child: const Text(
                          'Homam Register',
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
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0, bottom: 80.0),
                      child : SizedBox(
                        height: 65,
                        width : 140,
                      child: ElevatedButton(
                        onPressed: () {
                          navigateToVolunteerLayout(context);
                        },
                        style: ButtonStyle(


                          backgroundColor: MaterialStateProperty.resolveWith<
                              Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context).colorScheme.primary.withOpacity(0.0);
                            return Colors.transparent; // Use the component's default.
                          },
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: Colors.white.withOpacity(0.0))
                            ),
                          ),

                        ),
                        child: const Text(
                          'Volunteer Register',
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
                  ),






                ],

              )
            ],
          )),
    );
  }




}