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

import 'package:ssol/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ssol/tools/logger.dart';

class StorageProvider extends ChangeNotifier {
  StorageProvider({Key? key}) {
    init();
  }

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool isInit = false;

  ///*****************************  VARIABLES  *****************************/
  // TODO: user Info
  User _user = const User();

  get data => null;
  // TODO: login info
  // TODO: device info

  ///*****************************  BASE FUNCTION  *****************************/

  Future<void> init() async {
    try {
      Log.d(toString(), "run storageProvider");
      _user = (await getData(StorageKeys.user)) ?? const User();

      isInit = true;
    } catch (e) {
      Log.e(toString(), e.toString());
    }
    notifyListeners();
  }

  /// save the data
  Future<void> setData(StorageKeys key, dynamic data) async {
    await _storage.write(key: key.name, value: data);
    notifyListeners();
  }

  /// load the data
  Future<dynamic> getData(StorageKeys key) async {
    dynamic data;
    try {
      data = await _storage.read(key: key.name);
    } catch (e) {
      Log.e(toString(), "getData() : ${e.toString()}");
      data ??= "";
    }
    return data;
  }

  /// remove the data
  Future<dynamic> deleteData(StorageKeys key) async {
    await _storage.delete(key: key.name);
    notifyListeners();
  }

  ///*****************************  FUNCTIONS  *****************************/

  User get user => _user;
}

enum StorageKeys {
  user,
}

extension StorageEx on StorageKeys {
  String get _key => 'storage_key_';

  String get name {
    switch (this) {
      case StorageKeys.user:
        return _key + 'user';
      default:
        return _key;
    }
  }
}
