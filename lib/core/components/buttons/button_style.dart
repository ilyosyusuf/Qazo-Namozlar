import 'package:flutter/material.dart';
import 'package:qazonamozlar/core/constants/colors/color_const.dart';
import 'package:qazonamozlar/core/constants/radius/radius_const.dart';

class AllButtonStyles {
  static styleOfElevted({Color primaryColor = ColorConst.kPrimaryColor,required double height,required double width}) {
    return ElevatedButton.styleFrom(
      elevation: 20,
      shadowColor: ColorConst.kPrimaryColor,
      primary: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiuConst.small)
      ),
      fixedSize: Size(width, height)
    );
  }
}