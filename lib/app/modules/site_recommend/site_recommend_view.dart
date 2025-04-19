import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/site_recommend/site_recommend_controller.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';

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
          'Site Recommendations',
        ),
        actions: [
          IconButton(
            onPressed: controller.handleFavClick,
            icon: Icon(
              Icons.favorite,
              color: ColorConstant.onPrimaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: controller.getAllSiteDataLength(),
          itemBuilder: (context, index) => controller.getSetCard(
            context: context,
            index: index,
          ),
        ),
      ),
    );
  }
}
