import 'package:get/get.dart';

class SurveyFinishedViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
} 

class SurveyFinishedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyFinishedViewModel());
  }
}