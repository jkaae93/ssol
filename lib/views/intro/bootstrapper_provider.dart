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
import 'package:flutter/cupertino.dart';
import 'package:ssol/settings/bootstrapper.dart';

class BootstrapperProvider extends ChangeNotifier {
  final StorageProvider _storage = StorageProvider();
  BootstrapperProvider() {
    Bootstrapper();
    _storage.init();
  }
}
