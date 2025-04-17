import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/stopwatch/stopwatch_controller.dart';

class StopwatchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StopwatchController>(
      () => StopwatchController(),
      fenix: true,
    );
  }
}