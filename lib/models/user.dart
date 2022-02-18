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

import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({this.name = '', this.deviceCount = 0, this.petsCount = 0});

  final String name;
  final int deviceCount;
  final int petsCount;

  @override
  String toString() {
    return 'User(name: $name, deviceCount: $deviceCount, petsCount: $petsCount)';
  }

  factory User.fromJson(Map<String, Object?> json) => User(
        name: json['name'] as String,
        deviceCount: json['device_count'] as int,
        petsCount: json['pets_count'] as int,
      );

  Map<String, Object?> toJson() => {
        'name': name,
        'device_count': deviceCount,
        'pets_count': petsCount,
      };
}
