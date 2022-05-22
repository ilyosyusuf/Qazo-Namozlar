import 'package:flutter/material.dart';
import 'package:qazonamozlar/core/constants/colors/color_const.dart';
import 'package:qazonamozlar/core/constants/icons/icon_const.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kPrimaryColor,
      body: Center(
        child: IconConst.logo,
      ),
    );
  }
}