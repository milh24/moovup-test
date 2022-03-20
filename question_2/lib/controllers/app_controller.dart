import 'package:get/get.dart';
import 'package:question_2/models/person.dart';
import 'package:question_2/services/service.dart';

class AppController extends GetxController {
  static AppController to = Get.find();
  Rx<bool> loading = Rx<bool>(true);
  Rx<List<Person>> people = Rx<List<Person>>([]);

  @override
  void onInit() async {
    super.onInit();
    people.value = await Service.getAll();
    loading.value = false;
    update();
  }
}
