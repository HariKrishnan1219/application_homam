import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:homam/constants/constants.dart';
import 'package:homam/model/slider.dart';
import 'package:homam/ui_view/GetStarted.dart';
import 'package:homam/widgets/slide_dots.dart';
import 'package:homam/widgets/slide_items/slide_item.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homam/ui_view/layout.dart';
import 'package:homam/ui_view/Skip.dart';
import 'package:homam/ui_view/GetStarted.dart';





class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);


  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }




  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,

          children: <Widget>[

        PageView.builder(
        scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: sliderArrayList.length,
          itemBuilder: (ctx, i) => SlideItem(i),
        ),
                    Container(


                            child: Stack(


                            children: <Widget>[

                            if (_currentPage == 0)
                            LayoutScreen(true)
                              else if(_currentPage==3)
                                StartScreen(true)
                            else
                            SkipScreen(true),
  ],
                    ),
                            ),









                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: EdgeInsets.only(bottom: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    ),
                  ],
                ),


            ));



}


