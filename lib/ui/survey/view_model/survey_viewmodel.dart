import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/scroll_util.dart';
import '/data/models/survey_model.dart';
import '/utils/log.dart';
import '/config/config.dart';
import '/data/data_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  void onInit() async {
    // _createDummyData();

    super.onInit();
    dummyFocusNode.addListener(() {
      if (dummyFocusNode.hasFocus) {}
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

  Future<void> initData() async {
    surveys.clear();
    final response = await http.get(
      Uri.parse(
        API.getURL(int.parse(DataStorage().id), EndPoint.GET_QUESTIONS),
      ),
    );
    final data = jsonDecode(response.body);

    var sortedEntries = data.entries.toList()
      ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));
    Map<String, dynamic> sortedMap = {
      for (var e in sortedEntries) e.key: e.value,
    };
    print(sortedMap.runtimeType);
    for (var e in sortedMap.entries) {
      print("e.key: ${e.key}, e.value: ${e.value}");
      surveys.add(SurveyModel(id: int.parse( e.key), question: e.value));
    }
  }

  // ------------------------------------------------------------

  void _createDummyData() {
    surveys.clear();
    List<String> questions = [
      "店舗のデザイン",
      "店舗の明るさ",
      "店舗のBGM",
      "店舗の居心地",
      "店舗のレイアウト",
      "通路幅の広さ",
      "商品の探しやすさ",
      "座席の快適さ",
      "レジの使いやすさ",
      "店内の温度",
      "・・・",
      "・・・",
      "・・・",
      "・・・",
      "・・・",
    ];
    for (int i = 0; i < 15; i++) {
      surveys.add(SurveyModel(id: i, question: questions[i]));
    }
  }

  void focus(GlobalKey key) {
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
