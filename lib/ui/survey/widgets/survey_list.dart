import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import '../view_model/survey_viewmodel.dart';
import '/ui/survey/widgets/survey_item.dart';

class SurveyList extends GetWidget<SurveyViewModel> {
  SurveyList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Container();
        }else{
          return Obx(() => Column(
            children: List.generate(
              controller.surveys.length,
              (index) => SurveyItem(
                model: controller.surveys[index],
                globalKey: GlobalKey(),
              ),
            ),
          ));
        }
        
        
      },
    );
  }
}
