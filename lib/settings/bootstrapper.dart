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
