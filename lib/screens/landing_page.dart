import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homam/constants/constants.dart';
import 'package:homam/ui_view/slider_layout_view.dart';
import 'package:homam/widgets/custom_font.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE8F5E9),
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}
