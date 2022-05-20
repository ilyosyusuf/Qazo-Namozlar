import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qazonamozlar/screens/onboarding/state/onboarding_state.dart';

class OnBoardCubit extends Cubit<OnBoardingState> {
  List<String> languages = ['O’zbek tili', 'Русский язык', 'English'];

  List pic = [
    'assets/images/uzb.png',
    'assets/images/rus.png',
    'assets/images/eng.png',
  ];

  int indexSplash = 0;

  onChangeInfo() {
    indexSplash++;
    if (indexSplash == 3) {
      indexSplash = 0;
    }
    debugPrint(indexSplash.toString());
  }

  List splashPics = [
    'assets/images/splash/splash1.png',
    'assets/images/splash/splash2.png',
    'assets/images/splash/splash3.png',
  ];

  changeLang(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false);
  }

  OnBoardCubit() : super(SplashInitial()) {
    changeSplash();
  }

  changeSplash() async {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      emit(LangState());
    });
  }
}