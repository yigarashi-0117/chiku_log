import 'package:web/web.dart' as web;
import 'package:flutter/foundation.dart' show kIsWeb;
import '/utils/log.dart';
import 'package:pwa_install/pwa_install.dart';
import 'dart:js_interop';


@JS("alert")
external void dartAlert(String alert); // 厳密には文字列に変換できるオブジェクトを受け入れるが、APIがString「も」許容すれば大丈夫


class PwaUtil {
  static bool isPwa() {
    if (kIsWeb) {
      if (web.window.matchMedia('(display-mode: standalone)').matches) {
        Log().d('PWAとして起動中');
        return true;
      } else {
        Log().d('ブラウザタブで起動中');
        // ブラウザタブで起動中
        return false;
      }
      //web.window.navigator.serviceWorker.register('service-worker.js');
    }
    return false;
  }

  static void addAppInstalledEventListener(Function(web.CustomEvent) callback) {
    web.window.addEventListener('appinstalled', callback.toJS);
  }
  
  static void removeAppInstalledEventListener(Function(web.CustomEvent) callback) {
    web.window.removeEventListener('appinstalled', callback.toJS);
  }

}
