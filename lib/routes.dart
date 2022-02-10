import 'package:ssol/views/user/mypage.dart';
import 'package:flutter/material.dart';

import 'views/home/home.dart';
import 'views/intro/intro.dart';

class Routes {
  static Map<String, WidgetBuilder> init() {
    return {
      home: (context) => const Home(),
      mypage: (context) => const Mypage(),
    };
  }

  static const String root = '/';
  static const String home = '/home';
  static const String mypage = '/mypage';
}
