import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/data_storage.dart';
import 'package:dio/dio.dart';

class GiftViewModel extends GetxController {
  static const String _API_URL = '';
  final RxString giftCode = ''.obs;

  final dio = Dio();

  @override
  void onInit() async {
    // TODO: アクセスコードを取得
    final response = await dio.get(_API_URL);
    giftCode.value = response.data['code'];

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dio.close();
    super.onClose();
  }

}

class GiftViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GiftViewModel());
  }
}