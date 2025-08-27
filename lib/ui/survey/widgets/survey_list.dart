import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import '../view_model/survey_viewmodel.dart';
import '/ui/survey/widgets/survey_item.dart';

class SurveyList extends GetWidget<SurveyViewModel> {
  SurveyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        controller.surveys.length, (index) => 
        SurveyItem(
          model: controller.surveys[index],
          globalKey: GlobalKey()
        ),
      ),
    );
  }
}
