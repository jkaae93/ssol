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

import 'package:ssol/providers/storage_provider.dart';
import 'package:ssol/styles/colors.dart';
import 'package:ssol/views/intro/bootstrapper_provider.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'routes.dart';
import 'settings/bootstrapper.dart';
import 'views/intro/intro.dart';

void main() {
  runApp(const Ssol());
}

class Ssol extends StatefulWidget {
  const Ssol({Key? key}) : super(key: key);

  @override
  State<Ssol> createState() => _SsolState();
}

class _SsolState extends State<Ssol> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BootstrapperProvider();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BootstrapperProvider>(create: (context) => BootstrapperProvider()),
        ChangeNotifierProvider<StorageProvider>(create: (context) => StorageProvider()),
      ],
      child: MaterialApp(
        title: S.current.main_msg,
        localizationsDelegates: const [
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: Solors().lightTheme,
        darkTheme: Solors().darkTheme,
        themeMode: ThemeMode.system,
        home: DoubleBack(message: S.current.double_tap_msg, child: const Intro()),
        initialRoute: Routes.root,
        routes: Routes.init(),
      ),
    );
  }
}
