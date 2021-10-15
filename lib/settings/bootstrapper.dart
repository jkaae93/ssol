import 'package:firebase_core/firebase_core.dart';

class Bootstrapper {
  /// First time run, add init modules
  Bootstrapper() {
    init();
  }

  late FirebaseApp _firebaseApp;
  Future<void> init() async {
    _firebaseApp = Firebase.app();
  }
}
