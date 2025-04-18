import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/site_favorite/site_favorite_controller.dart';

class SiteFavoriteView extends StatelessWidget {
  const SiteFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    SiteFavoriteController controller = Get.put(SiteFavoriteController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.handleBack,
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'List Site Favorite',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Obx(
          () => controller.getDataLength() < 1
              ? Center(
                  child: Text('Anda belum memiliki site favorite.'),
                )
              : ListView.builder(
                  itemCount: controller.getDataLength(),
                  itemBuilder: (context, index) => controller.getSetCard(
                    context: context,
                    index: index,
                  ),
                ),
        ),
      ),
    );
  }
}
