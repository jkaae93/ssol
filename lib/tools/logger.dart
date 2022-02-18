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
import 'package:logging/logging.dart';

class Log {
  static final Logger _logger = Logger('ssol');
  Log() {
    Logger.root.level = Level.ALL;
  }

  static void d(String className, String message) {
    if (kDebugMode) printLog("DEBUG", className, "${DateTime.now().toUtc()} | $message");
  }

  static void i(String className, String message) {
    printLog("INFO", className, "${DateTime.now().toUtc()} | $message");
  }

  static void w(String className, String message) {
    printLog("WARN", className, "${DateTime.now().toUtc()} | $message");
  }

  static void e(String className, String message) {
    printLog("ERROR", className, "${DateTime.now().toUtc()} | $message");
  }

  static void printLog(String level, String className, String message) {
    if (kDebugMode) print("SSOL | $level | ${className.replaceAll("Instance of ", "")} | $message");
  }
}
