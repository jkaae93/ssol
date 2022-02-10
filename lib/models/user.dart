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
