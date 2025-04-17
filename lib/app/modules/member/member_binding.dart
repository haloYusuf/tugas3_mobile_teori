import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/member/member_controller.dart';

class MemberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberController>(() => MemberController());
  }
}