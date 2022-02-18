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

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';

class Solors {
  static final Color main = m.Colors.blue.shade200;

  static const Color red = Color(0xffe05526);
  static const Color orange = Color(0xffe99d23);
  static const Color green = Color(0xff3e7136);
  static const Color black = Color(0xff323D3D);
  static const Color grey = Color(0xff323D3D);
  static const Color brown = Color(0xff917464);
  static const Color white = Color(0xfffbfbf3);

  FlexScheme mainColor = FlexScheme.blueWhale;

  m.ThemeData theme(ColorScheme scheme) => m.ThemeData(
        pageTransitionsTheme: const m.PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        fontFamily: 'IBMPlexSansKR',
        colorScheme: scheme,
      );

  m.ThemeData get lightTheme => theme(FlexThemeData.light(scheme: Solors().mainColor).colorScheme);

  m.ThemeData get darkTheme => theme(FlexThemeData.dark(scheme: Solors().mainColor).colorScheme);
}
