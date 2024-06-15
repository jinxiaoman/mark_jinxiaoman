import 'package:logger/logger.dart';

/// 判断程序当前的运行环境
bool inProduction() {
  return const bool.fromEnvironment("dart.vm.product");
}

/// 是否debug环境
final bool isDebug = !inProduction();

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 80,
      colors: false,
      printEmojis: false,
      printTime: false,
    ),
  );

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDebug) {
      _logger.d(message, error: error, stackTrace: stackTrace);
    }
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
