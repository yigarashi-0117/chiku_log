import 'package:chiku_log/ui/survey/view_model/survey_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/survey_model.dart';
import '/ui/survey/widgets/survey_radio_button.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class SurveyItem extends StatelessWidget {
  final SurveyModel model;
  final GlobalKey globalKey;
  const SurveyItem({super.key, required this.model, required this.globalKey});

  @override
  Widget build(BuildContext context) {
    SurveyViewModel controller = Get.find();
    return Container(
      key: globalKey,
      // height: 200,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
        // border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
            width: 35,
            height: 35,

            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              //border: Border.all(color: Colors.grey, width: 1),
            ),
            margin: const EdgeInsets.fromLTRB(0, 0, 16, 16),
            child: Text("${model.id}", style:TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
          ),
              Container(
             //width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            child: Text("${model.question}", style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.left,),
          ),
            ],
          ),
          const SizedBox(height: 16),
          
          SurveyRadioButton(
            id: model.id,
            onRadioChanged: (score) {
              controller.updateScore(model.id, score);
            },
          ),
          const SizedBox(height: 32),
          PointerInterceptor(
            child: TextField(
              // focusNode: controller.focusNode,
              onTap: () => controller.focus(globalKey),
              onSubmitted: (value) => controller.unfocus(),
              onTapOutside: (event) => controller.unfocus(),
              style: Theme.of(context).textTheme.labelMedium,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
                // border: InputBorder.none,
                labelText: 'ご意見ございましたらお聞かせください…',
                labelStyle: Theme.of(context).textTheme.labelMedium,
                floatingLabelStyle: TextStyle(color: Colors.black.withAlpha(0)),
                fillColor: Color(0xffeeeeee),
                filled: true,
                isDense: false,
                contentPadding: const EdgeInsets.all(12),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
