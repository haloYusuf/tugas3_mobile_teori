import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.getHeaderContent(),
        ),
        actions: [
          IconButton(
            onPressed: controller.handleLogOut,
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 18,
              children: [
                Text(
                  'Fitur yang Tersedia',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                controller.getContentButton(
                  index: 0,
                  title: 'Stopwatch',
                ),
                controller.getContentButton(
                  index: 1,
                  title: 'Number Detection',
                ),
                controller.getContentButton(
                  index: 2,
                  title: 'LBS Tracker',
                ),
                controller.getContentButton(
                  index: 3,
                  title: 'Time Conversion',
                ),
                controller.getContentButton(
                  index: 4,
                  title: 'Site Recommendations',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
