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
