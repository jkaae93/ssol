/*
  Copyright 2021 Celine Jeon

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
 */

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
