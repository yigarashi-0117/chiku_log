import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/header.dart';
import '../../../routing/routes.dart';
import '../view_model/top_viewmodel.dart';

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
            child: Text('この度はお買い上げいただきまして誠にありがとうございます。\nお店に関するアンケート調査になります。\n回答後、Amazonギフトカードのアクセスコードが表示されます。', 
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
            ),
            Container(
              width: 150,
              // height: 50,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: Obx(() => DropdownButton<String>(
                hint: Text('年齢', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                isExpanded: true,
                items:  [
                  DropdownMenuItem<String>(child: Text(''), value: '',),
                  DropdownMenuItem<String>(child: Text('~10代'), value: '10',),
                  DropdownMenuItem<String>(child: Text('~20代'), value: '20',),
                  DropdownMenuItem<String>(child: Text('~30代'), value: '30',),
                  DropdownMenuItem<String>(child: Text('~40代'), value: '40',),
                  DropdownMenuItem<String>(child: Text('50代~'), value: '50',),
               
                ],
                value: controller.age.value,
                onChanged: (value) {
                  controller.setAge(value ?? '');
                },
              )),
            ),  

            Container(
              width: 150,
              // height: 50,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 50),
              child: Obx(() => DropdownButton<String>(
                isExpanded: true,
                items:  [
                  DropdownMenuItem<String>(child: Text(''), value: '',),
                  DropdownMenuItem<String>(child: Text('男性'), value: '男性',),
                  DropdownMenuItem<String>(child: Text('女性'), value: '女性',),
                  DropdownMenuItem<String>(child: Text('未解答'), value: '未解答',),
                  
               
                ],
                value: controller.gender.value,
                onChanged: (value) {
                  controller.setGender(value ?? '');
                },
              )),
            ),  

            ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.SURVEY);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child:SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text('次へ'),
                  ),
                ),
              ),
            
      
        ],
      ),
    ));
  }
}

/*
この度はお買い上げいただきまして誠にありがとうございます。
お店に関するアンケート調査になります。
回答後、Amazonギフトカードのアクセスコードが表示されます。

*/