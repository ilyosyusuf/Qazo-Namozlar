import 'package:flutter/material.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes.init();
  static MyRoutes get instance => _instance;
  MyRoutes.init();

  Route? ongenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
 
    }
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}
