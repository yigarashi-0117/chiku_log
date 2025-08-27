import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Log {
  static late Talker _talker;
  static late LogObserver _observer;
  static final Log _instance = Log._internal();

  factory Log() {
    return _instance;
  }

  Log._internal() {
    // init
    _observer = LogObserver();
    _talker = TalkerFlutter.init(observer: _observer);
  }

  Talker get talker => _talker;

  void i(String message) {
    _talker.info(message);
  }

  void d(String message) {
    _talker.debug(message);
  }

  void w(String message) {
    _talker.warning(message);
  }

  void e(String message) {
    _talker.error(message);
  }

  void v(String message) {
    _talker.verbose(message);
  }
}

/*
  
*/
class LogObserver extends TalkerObserver {
  LogObserver();

  @override
  void onError(TalkerError err) {
    /// Send data to your error tracking system like Sentry or backend
    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    /// Send Exception to your error tracking system like Sentry or backend
    super.onException(err);
  }

  @override
  void onLog(TalkerData log) {
    /// Send log message to Grafana or backend
    super.onLog(log);
    if (log.logLevel == LogLevel.debug || log.logLevel == LogLevel.info) {
      return;
    }
    _saveLogToFile(log.toString());
  }

  // ================================
  // Private methods
  // ================================

  void _saveLogToFile(String message) {
    if (!kIsWeb && !kIsWasm) {
      // TODO: ログファイルに保存する
    }
  }
}
