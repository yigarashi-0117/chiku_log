import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../survey/view_model/survey_viewmodel.dart';

class Header extends GetWidget<SurveyViewModel> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 100,
      alignment: Alignment.center,
      child: Text('お店のデザイン・お店の使いやすさ\nアンケート', style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 122, 18, 18), width:4),
        ),
      ),
    );
  }
}