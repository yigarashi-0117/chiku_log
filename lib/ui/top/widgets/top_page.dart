import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/header.dart';
import '../../../routing/routes.dart';
import '../view_model/top_viewmodel.dart';

import '../../../ui/core/themes/theme.dart';
import 'age_radio_button.dart';
import '../../../data/data_storage.dart';

class TopPage extends GetWidget<TopViewModel> {
  const TopPage({super.key});

  Widget _buildGiftUnavailable() {
    return  Center(
        child: 
          Text("アンケートは終了しました。\nまたのご利用をお待ちしております。",textAlign: TextAlign.center,),
      
    );
  }

  Widget _buildGiftAvailable(BuildContext context) {
    return SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Header(),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(32),
              child: Text(
                'この度はお買い上げいただきまして誠にありがとうございます。\nお店に関するアンケート調査になります。\n回答後、Amazonギフトカードのアクセスコードが表示されます。\n※ 平均点が1.0超〜5.0未満になる範囲で回答をお願いします。',
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
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: DataStorage().initizalize(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DataStorage().isGiftAvailable ? _buildGiftAvailable(context) : _buildGiftUnavailable();
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
