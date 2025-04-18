import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/site_recommend/site_recommend_controller.dart';

class SiteRecommendView extends StatelessWidget {
  const SiteRecommendView({super.key});

  @override
  Widget build(BuildContext context) {
    SiteRecommendController controller = Get.put(SiteRecommendController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.handleBack,
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Site Recomendations',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
        ],
      ),
    );
  }
}
