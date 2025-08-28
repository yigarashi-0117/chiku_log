import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/ui/core/themes/theme.dart';
import '/routing/router.dart';
import '/routing/routes.dart';

// import 'package:web/web.dart' as web;
import 'package:hive_flutter/hive_flutter.dart';

import '/utils/log.dart';


void main() async {
  // web.window.navigator.storage.persist(); // CHECK: 機能してる？　必要ない？　

  // TODO: テナントIDを抽出する　、データ構造の定義　
  //URL取得
  String myurl = Uri.base.toString();
  Log().d(myurl);
  String? id = Uri.base.queryParameters["text"];
  Log().d(id ?? "no id");
  // TODO: URLを隠蔽する　
  // web.window.history.replaceState(null, '', '/aiueo');

  WidgetsFlutterBinding.ensureInitialized();

  // !: init hive : indexedDB
  await Hive.initFlutter();
  await Hive.openBox('log');
  final box = Hive.box('log'); // 既に open していれば取得だけ
  final counter = box.get('counter', defaultValue: 0);
  await box.put('counter', counter + 1);
  final token = box.get('counter');    // => 'abc123'
  Log().d(token.toString());
  // TODO: 回答済みの場合は結果ページへ遷移。取得済みのアマギフ番号を表示 


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Survey App',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      //scrollBehavior: ,
      getPages: router,
      initialRoute: Routes.HOME,
      //routes: // NOTE: flutter標準のルーター これは使わない
    );
  }
}
