import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/survey_viewmodel.dart';
import '../../common/widgets/header.dart';
import 'survey_list.dart';
import '/routing/routes.dart';

class SurveyPage extends GetWidget<SurveyViewModel> {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // HACK:
      extendBody: false,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: Icon(Icons.bug_report_rounded, color: Colors.black,),
          onPressed: () {
            Get.toNamed(Routes.DEBUG);
          },
        ),
        actions:[]
      ),

      body: Container(
        // height: MediaQuery.of(context).size.height-100,
        color: Theme.of(context).colorScheme.surface,
        child: SingleChildScrollView(
          controller: controller.scrollController,

          padding: EdgeInsets.only(bottom: 80),
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag, // CHECK:
          child: Column(
            children: [
              Header(),
              SurveyList(),
              Container(
                width: 200,
                height: 60,
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    controller.unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('回答'),
                ),
              ),
              Obx(() => SizedBox(height: controller.bottomPadding.value)),
            ],
          ),
        ),
      ),
    );
  }
}
