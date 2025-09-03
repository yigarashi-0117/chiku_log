import 'package:hive_flutter/hive_flutter.dart';
import '/utils/log.dart';

class DataStorage {
  String id = "";
  // private constructor
  DataStorage._() {
    
  }

  static final DataStorage _instance = DataStorage._();

  factory DataStorage() {
    return _instance;
  }

  Future<void> initizalize() async {
    await Hive.initFlutter();

    // TODO: テナントIDを抽出する　、データ構造の定義
    //URL取得
    id = Uri.base.queryParameters["id"] ?? "id_not_found";
 
    await Hive.initFlutter();
    await Hive.openBox(id);
    final box = Hive.box(id); // 既に open していれば取得だけ


    final counter = box.get('counter', defaultValue: 0);
    await box.put('counter', counter + 1);
    final token = box.get('counter'); // => 'abc123'
    Log().d(token.toString());
    
  }

  void close() async {
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
