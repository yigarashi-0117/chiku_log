import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/scroll_util.dart';
import '/data/models/survey_model.dart';
import '/utils/log.dart';

class SurveyViewModel extends GetxController {
  final RxList<SurveyModel> surveys = <SurveyModel>[].obs;
  
  final RxInt currentQuestionIndex = 0.obs;
  final RxDouble bottomPadding = 0.0.obs;
  final RxString msg = "".obs;

  final double scrollTopOffset = 50;

  final ScrollController scrollController = ScrollController();
  final FocusNode dummyFocusNode = FocusNode();

  double _currentOffset = 0.0;
  

  // [ lifecycle ]
  @override
  void onInit() {
    createDummyData();
    
    super.onInit();
    dummyFocusNode.addListener(() {
      if (dummyFocusNode.hasFocus) {
        
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dummyFocusNode.dispose();
    super.onClose();
  }

  // ------------------------------------------------------------

  void createDummyData() {
    surveys.clear();
    for (int i = 0; i < 10; i++) {
      surveys.add(SurveyModel(id: i, question: "Question $i"));
    }
  }

  void focus( GlobalKey key) {
    
    bottomPadding.value = 300;
    // scrollController.animateTo(
    //   scrollController.position.pixels+300,
    //   duration: const Duration(milliseconds: 30),
    //   curve: Curves.easeInOut,
    // );
    _currentOffset = scrollController.offset;

    final (x, y) = getWidgetGlobalPosition(key);
    final newOffset = _currentOffset + y - scrollTopOffset;
    scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    msg.value = "newOffset: $newOffset";
    // Rect.fromLTWH(topLeft.dx, topLeft.dy, box.size.width, box.size.height);
  }

  void unfocus() {
   
    bottomPadding.value = 0;
    // scrollController.animateTo(
    //   _currentOffset,
    //   duration: const Duration(milliseconds: 30),
    //   curve: Curves.easeInOut,
    // );
    FocusScope.of(Get.context!).unfocus();
  }

  void updateScore(int id, int score) {
    surveys.firstWhere((element) => element.id == id).score = score;
    Log().d("[survey_viewmodel] updateScore: $id, $score");
  }
}

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyViewModel());
    
  }
}
