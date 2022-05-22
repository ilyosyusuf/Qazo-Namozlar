import 'package:flutter/material.dart';
import 'package:qazonamozlar/screens/onboarding/view/infoboarding/info_boarding.dart';
import 'package:qazonamozlar/screens/onboarding/view/mainboarding/main_boarding.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes.init();
  static MyRoutes get instance => _instance;
  MyRoutes.init();

  Route? ongenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/onBoard':
        return pageReturner(const OnBoardingView());
      case '/infoboard':
        return pageReturner(const InfoBoarding());  
    }
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}
