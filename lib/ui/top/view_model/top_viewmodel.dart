import 'package:get/get.dart';

class TopViewModel extends GetxController {
  final RxString age = ''.obs;
  final RxString gender = ''.obs;

  void setAge(String value) {
    age.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }
}

class TopViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopViewModel());
  }
}