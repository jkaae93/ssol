import 'package:ssol/services/ble_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ssol/tools/logger.dart';

class Bootstrapper {
  /// First time run, add init modules
  Bootstrapper() {
    init();
  }

  late FirebaseApp _firebaseApp;
  late BleManager _ble;
  final List<Permission> _permissions = [
    Permission.bluetooth,
    Permission.camera,
    Permission.notification,
    Permission.photos,
    Permission.bluetoothAdvertise,
    Permission.bluetoothConnect,
    Permission.bluetoothScan,
    Permission.location,
    Permission.locationAlways,
    Permission.locationWhenInUse,
    Permission.storage,
  ];

  Future<void> init() async {
    // _firebaseApp = Firebase.app();
    _ble = BleManager();
    _initPermissions();
  }

  Future<void> _initPermissions() async {
    try {
      Map<Permission, PermissionStatus> statuses = await _permissions.request();
      statuses.forEach((permission, status) async {
        Log.d(
            toString(),
            {
              'permission': permission.toString(),
              'status': status.toString(),
            }.toString());
        if (status.isRestricted || status.isDenied) {
          await permission.request();
        } else if (status.isPermanentlyDenied) {
          openAppSettings();
        }
      });
    } catch (e) {
      Log.e(toString(), e.toString());
    }
  }
}
