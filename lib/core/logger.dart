import 'dart:developer' as developer;

class AppLogger {
  static void debug(String message, {String tag = "DEBUG"}) {
    developer.log("[$tag] $message");
  }

  static void error(String message, {String tag = "ERROR", dynamic error, StackTrace? stackTrace}) {
    developer.log(
      "[$tag] $message",
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void info(String message, {String tag = "INFO"}) {
    developer.log("[$tag] $message");
  }
}