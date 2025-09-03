import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/header.dart';
import '../../../routing/routes.dart';
import '../view_model/top_viewmodel.dart';

import '../../../ui/core/themes/theme.dart';
import 'age_radio_button.dart';

class TopPage extends GetWidget<TopViewModel> {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Header(),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(32),
              child: Text(
                'この度はお買い上げいただきまして誠にありがとうございます。\nお店に関するアンケート調査になります。\n回答後、Amazonギフトカードのアクセスコードが表示されます。',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
            ),
            // :: RadioButton ::
            Container(
              width: double.infinity,
              // height: 50,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: AgeRadioButton(
                onRadioChanged: (age) async {
                  controller.setAge(age);
                },
              ),
            ),

            SizedBox(height: 16),
            // :: 次へボタン ::
            Obx(
              () => controller.isChecked.value
                  ? ElevatedButton(
                      onPressed: () async {
                        // final current = web.window.location.href;
                        // Log().d("[onPressed] ${current}");
                        await Get.offAllNamed(Routes.SURVEY);
                        // await Get.offAll(
                        //   SurveyPage(),
                        //   binding: SurveyBinding(),
                        //   routeName: Routes.HOME,
                        // );
                        // web.window.history.replaceState(null, '', current);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: Center(
                          child: Text(
                            '次へ',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppTheme.white),
                          ),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.disabledColor,
                        foregroundColor: AppTheme.disabledColor,
                        shadowColor: Color.fromARGB(0, 0, 0, 0),
                        elevation: 0,
                      ),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: Center(
                          child: Text(
                            '次へ',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppTheme.white),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
