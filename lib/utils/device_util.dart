import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

const MOBILE_SCREEN_WIDTH = 430;
const TABLET_SCREEN_WIDTH = 1024;

enum DeviceType {
  PC,
  TABLET,
  MOBILE,
}

class DeviceUtil {

  // TODO: iphone / android の判定を追加する 
  
  // モバイル端末かどうかiPhone,androidスマートフォン
  static bool isMobileUserAgent() {
    String userAgent = web.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('iphone') ||
           (userAgent.contains('android') && userAgent.contains('mobile'));
  }

  // タブレット端末かどうかiPadやAndroidタブレット
  static bool isTabletUserAgent() {
    String userAgent = web.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('ipad') || userAgent.contains('macintosh') ||
        // androidタブレット
       userAgent.contains('linux; android') ||
       // windowsタブレット
       (userAgent.contains('windows') && userAgent.contains('touch'));
  }

  // Windowsタブレットかどうか
  static bool isWindowsTablet() {
    String userAgent = web.window.navigator.userAgent.toLowerCase();
    return (userAgent.contains('windows') && userAgent.contains('touch')) ||
            (userAgent.contains('windows') && userAgent.contains('tablet'));
  }
  // タッチ可能かどうか
  static bool isTouchScreen() {
    return web.window.navigator.maxTouchPoints > 0;
  }

  static DeviceType detectDeviceType(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (isMobileUserAgent() || screenWidth < MOBILE_SCREEN_WIDTH) {// お好みで
      return DeviceType.MOBILE; 
    } else if (isTabletUserAgent() || screenWidth <= TABLET_SCREEN_WIDTH) {// お好みで
      if (isTouchScreen() || isTabletUserAgent()) {
        return DeviceType.TABLET; 
      }
      return DeviceType.PC; // タブレットでもタッチスクリーンがない場合PCとみなす
    } else if (isWindowsTablet()) {
      return DeviceType.TABLET; // Windowsタブレット
    } else {
      return DeviceType.PC; 
    }
  }
}
