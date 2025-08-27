import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/survey_viewmodel.dart';

class SurveyHeader extends GetWidget<SurveyViewModel> {
  const SurveyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 100,
      alignment: Alignment.center,
      child: Text('Survey Header'),
    );
  }
}