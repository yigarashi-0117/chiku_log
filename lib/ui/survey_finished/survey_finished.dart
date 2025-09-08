import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './viewmodel/survey_finished_viewmodel.dart';

class SurveyFinishedPage extends GetWidget<SurveyFinishedViewModel> {
  const SurveyFinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'アンケートは終了しております。\nご協力ありがとうございました。',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
