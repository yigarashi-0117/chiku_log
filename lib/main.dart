import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/ui/core/themes/theme.dart';
import '/routing/router.dart';
import '/routing/routes.dart';

import 'package:web/web.dart' as web;
import 'package:hive_flutter/hive_flutter.dart';

import '/utils/log.dart';
import 'package:go_router/go_router.dart';
import '/data/data_storage.dart';


void main() async {
  // web.window.navigator.storage.persist(); // CHECK: 機能してる？　必要ない？　
  DataStorage().initizalize();
  // TODO: 回答済みの場合は結果ページへ遷移。取得済みのアマギフ番号を表示 
  

  WidgetsFlutterBinding.ensureInitialized();
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
      // routerNeglect: true,   
      getPages: router,
      initialRoute: Routes.HOME,
      routingCallback: (route) async {
        Log().d("[routingCallback] ${route.toString()}");
        // web.window.history.replaceState(null, '', '/');
        // final current = web.window.location.href;
        // await Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
        // 遷移後にURLを元へ（履歴は増やさない）
        // web.window.history.replaceState(null, '', current);
      },
      //routes: // NOTE: flutter標準のルーター これは使わない
    );
  }
}
