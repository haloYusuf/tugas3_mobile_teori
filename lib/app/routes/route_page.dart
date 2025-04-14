import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/login/login_view.dart';
import 'package:tugas3_mobile_teori/app/modules/main/main_view.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';

class RoutePage {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: RouteName.main,
      page: () => MainView(),
    ),
  ];
}
