// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:qazonamozlar/screens/onboarding/state/onboarding_state.dart';

// class OnBoardCubit extends Cubit<OnBoardingState> {
//   List<String> languages = ['O’zbek tili', 'Русский язык', 'English'];
//   List<String> langcodes = ['uz','ru', 'en'];

//   List pic = [
//     'assets/images/uzb.png',
//     'assets/images/rus.png',
//     'assets/images/eng.png',
//   ];

//   int indexSplash = 0;

//   onChangeInfo() {
//     indexSplash++;
//     if (indexSplash == 3) {
//       indexSplash = 0;
//     }
//     debugPrint(indexSplash.toString());
//   }

//   List splashPics = [
//     'assets/images/onboardinfo/on1.png',
//     'assets/images/onboardinfo/on2.png',
//     'assets/images/onboardinfo/on3.png',
//   ];

//   changeLang(BuildContext context) {
//     Navigator.pushNamedAndRemoveUntil(context, '/infoboard', (route) => false);
//   }

//   OnBoardCubit() : super(SplashInitial()) {
//     changeSplash();
//   }

//   changeSplash() async {
//     Future.delayed(const Duration(seconds: 5)).then((value) {
//       emit(LangState());
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qazonamozlar/screens/onboarding/state/onboarding_state.dart';

class OnBoardCubit extends Cubit<OnBoardingState> {
  List<String> languages = ['O’zbek tili', 'Русский язык', 'English'];
  List<String> langcodes = ['uz','ru', 'en'];

  // List pic = [
  //   'assets/images/uzbek.png',
  //   'assets/images/russian.png',
  //   'assets/images/english.png',
  // ];

    List pic = [
    'assets/images/uzb.png',
    'assets/images/rus.png',
    'assets/images/eng.png',
  ];

  int indexSplash = 0;

  onChangeInfo(BuildContext context, int index) {
    indexSplash = index;
        if (index == 0) {
      context.setLocale(const Locale('uz', 'UZ'));
    } else if (index == 1) {
      context.setLocale(const Locale('ru', 'RU'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
    emit(SplashState());
  }

  // List splashPics = [
  //   'assets/images/splash/splash1.png',
  //   'assets/images/splash/splash2.png',
  //   'assets/images/splash/splash3.png',
  // ];

    List splashPics = [
    'assets/images/onboardinfo/on1.png',
    'assets/images/onboardinfo/on2.png',
    'assets/images/onboardinfo/on3.png',
  ];

  changeLang(BuildContext context, int index) {
    Navigator.pushNamedAndRemoveUntil(context, '/infoboard', (route) => false);

    // if (index == 0) {
    //   context.setLocale(const Locale('uz', 'UZ'));
    // } else if (index == 1) {
    //   context.setLocale(const Locale('ru', 'RU'));
    // } else {
    //   context.setLocale(const Locale('en', 'US'));
    // }
  }

  OnBoardCubit() : super(SplashInitial()) {
    changeSplash();
  }

  changeSplash() async {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      emit(LangState());
    });
  }

  changeLocaleSplash(BuildContext context, index) {
   
      if (index == 0) {
        context.setLocale(const Locale('uz', 'UZ'));
      } else if (index == 1) {
        context.setLocale(const Locale('ru', 'RU'));
      } else {
        context.setLocale(const Locale('en', 'US'));
    }
  }
  
}