import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/ui/core/themes/theme.dart';
import '/routing/router.dart';
import '/routing/routes.dart';

void main() {
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
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      //scrollBehavior: ,
      getPages: router,
      initialRoute: Routes.SURVEY,
      //routes: // NOTE: flutter標準のルーター これは使わない 
    ); 
  }
}