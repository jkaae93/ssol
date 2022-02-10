import 'package:ssol/providers/storage_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssol/settings/bootstrapper.dart';

class BootstrapperProvider extends ChangeNotifier {
  final StorageProvider _storage = StorageProvider();
  BootstrapperProvider() {
    Bootstrapper();
    _storage.init();
  }
}
