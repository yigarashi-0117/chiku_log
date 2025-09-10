import 'package:hive_flutter/hive_flutter.dart';
import '/utils/log.dart';
import 'package:dio/dio.dart';
import '/config/config.dart';

class DataStorage {
  String id = "";
  Dio dio = Dio();
  bool isGiftAvailable = true;
  bool isInitialzed = false;

  // private constructor
  DataStorage._() {
    
  }

  static final DataStorage _instance = DataStorage._();

  factory DataStorage() {
    return _instance;
  }

  Future<void> initizalize() async {
    isInitialzed = false;
    await Hive.initFlutter();

    // TODO: テナントIDを抽出する　、データ構造の定義
    //URL取得
    id = Uri.base.queryParameters["survey_id"] ?? "0";
 
    await Hive.initFlutter();
    await Hive.openBox(id);
    final box = Hive.box(id); // 既に open していれば取得だけ


    final counter = box.get('counter', defaultValue: 0);
    await box.put('counter', counter + 1);
    final token = box.get('counter'); // => 'abc123'
    Log().d(token.toString());

    final response = await dio.get(API.getURL(int.parse(id), EndPoint.GIFT_IS_AVAILABLE));

    Map<String, dynamic> data = response.data as Map<String, dynamic>;
    isGiftAvailable = data["is_available"];
    Log().d("[DataStorage] isGiftAvailable: $isGiftAvailable");
    isInitialzed = true;
  }

  void close() async {
    dio.close();
    await Hive.close();
  }

  void saveData(String key, dynamic value) {
    final box = Hive.box(id);
    box.put(key, value);
  }

  dynamic getData(String key) {
    final box = Hive.box(id);
    return box.get(key);
  }


}
