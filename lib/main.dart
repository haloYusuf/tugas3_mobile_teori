import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';
import 'package:tugas3_mobile_teori/app/routes/route_page.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(SessionService());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Get.find<SessionService>();

    return GetMaterialApp(
      title: 'MultiApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: session.isLoggedIn() ? RouteName.home : RouteName.login,
      getPages: RoutePage.routes,
    );
  }
}
