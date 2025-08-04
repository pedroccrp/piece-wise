import 'dart:developer';

enum PiecewiseLoggerLevel { none, error, warning, info, debug }

const loggerName = 'PIECEWISE';

class PiecewiseLogger {
  static PiecewiseLoggerLevel _loggerLevel = PiecewiseLoggerLevel.debug;

  static void setLoggerLevel(PiecewiseLoggerLevel level) {
    _loggerLevel = level;
  }

  static void _showMessage(
    PiecewiseLoggerLevel level,
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (_loggerLevel.index < level.index) return;

    final timestamp = DateTime.now().toIso8601String();
    final formattedMessage =
        '[$loggerName] [$timestamp] [${level.name.toUpperCase()}] $message';

    // REMOVE_LATER: when the logger is working, remove this
    print(formattedMessage);

    // FIX: for some reason is not printing, or at least I cannot see it
    log(
      formattedMessage,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void error(String message, {dynamic error, StackTrace? stackTrace}) {
    _showMessage(
      PiecewiseLoggerLevel.error,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void warning(String message) {
    _showMessage(PiecewiseLoggerLevel.warning, message);
  }

  static void info(String message) {
    _showMessage(PiecewiseLoggerLevel.info, message);
  }

  static void debug(String message) {
    _showMessage(PiecewiseLoggerLevel.debug, message);
  }
}
