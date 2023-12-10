import 'package:e_learning/controllers/quiz_controller.dart';
import 'package:get/get.dart';


class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
