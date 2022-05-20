import 'package:flutter/material.dart';
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
      // case '/splash':
      //   return pageReturner(const OnBoardView());  
    }
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}
