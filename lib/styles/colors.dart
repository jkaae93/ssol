import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';

class Solors {
  static final Color main = m.Colors.blue.shade200;

  final Color red = const Color(0xffe05526);
  final Color orange = const Color(0xffe99d23);
  final Color green = const Color(0xff3e7136);
  final Color black = const Color(0xff323D3D);
  final Color grey = const Color(0xff323D3D);
  final Color brown = const Color(0xff917464);
  final Color white = const Color(0xfffbfbf3);

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
