import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:homam/constants/constants.dart';
import 'package:homam/model/slider.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
      ),
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
        )
        ),
      ],
    );
  }
}
