import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/about/about_view.dart';
import 'package:tugas3_mobile_teori/app/modules/home/home_view.dart';
import 'package:tugas3_mobile_teori/app/modules/member/member_view.dart';

class MainController extends GetxController {
  final listContent = [
    HomeView(),
    MemberView(),
    AboutView(),
  ];

  final _currentContent = 0.obs;

  void changeContentIndex(int index) {
    _currentContent.value = index;
  }

  int getCurrentContentIndex() {
    return _currentContent.value;
  }
}
