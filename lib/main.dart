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
        title: 'Welcome here is main.dart',
        localizationsDelegates: const [
          S.delegate,
        ],
        theme: Solors().lightTheme,
        darkTheme: Solors().darkTheme,
        themeMode: ThemeMode.system,
        home: const DoubleBack(message: "If you want to close, please on more tap.", child: Intro()),
        initialRoute: Routes.root,
        routes: Routes.init(),
      ),
    );
  }
}
