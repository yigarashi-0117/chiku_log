import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../ui/top/widgets/age_radio_button.dart';
import '../../../utils/log.dart';
import '../../../data/data_storage.dart';
class TopViewModel extends GetxController {
  final Rx<Age> age = (Age.none).obs;
  final RxString gender = ''.obs;
  final RxBool isChecked = false.obs;

  void setAge(Age value) {
    age.value = value;
    checkValid();
    _saveAge();
  }

  void setGender(String value) {
    gender.value = value;
  }

  void checkValid(){
    if(age.value != Age.none){
      isChecked.value = true;
    }
  }

  void _saveAge() async{
    DataStorage().saveData('age', age.value.value);
    // Log().d("[top_viewmodel] saveAge: $token");
  }


}

class TopViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopViewModel());
  }
}