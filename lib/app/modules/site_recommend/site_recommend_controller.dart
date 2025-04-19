import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/models/site_model.dart';
import 'package:tugas3_mobile_teori/app/routes/route_name.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteRecommendController extends GetxController {
  final _session = SessionService();
  final _refreshTrigger = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initCurrentFav();
  }

  void _initCurrentFav() {
    _refreshTrigger.value = List.generate(
      SiteModel.getAllSiteData.length,
      (index) => _session.getFav().contains(index) ? 1 : 0,
    );
  }

  Widget getSetCard({
    required BuildContext context,
    required int index,
  }) {
    SiteModel siteModel = SiteModel.getAllSiteData[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ListTile(
        onTap: () {
          Get.dialog(
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Text(
                      siteModel.siteName,
                    ),
                  ),
                  IconButton(
                    onPressed: Get.back,
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 32,
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 18,
                children: [
                  SizedBox(
                    height: 48,
                    child: Image.asset(
                      siteModel.siteImage,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        siteModel.siteDetail,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    _openWeb(siteModel.siteUrl);
                  },
                  child: Text(
                    'Kunjungi Website',
                  ),
                ),
              ],
            ),
            barrierDismissible: false,
          );
        },
        contentPadding: EdgeInsets.all(8),
        tileColor: ColorConstant.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        leading: SizedBox(
          height: 40,
          child: Image.asset(
            siteModel.siteImage,
            fit: BoxFit.fitHeight,
          ),
        ),
        title: Text(
          siteModel.siteName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.onPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            if (_refreshTrigger[index] == 0) {
              _refreshTrigger[index] = 1;
              _session.addFav(index);
            } else {
              _refreshTrigger[index] = 0;
              _session.removeFav(index);
            }
          },
          icon: Obx(
            () => Icon(
              _refreshTrigger[index] == 1
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: _refreshTrigger[index] == 1
                  ? Colors.black
                  : ColorConstant.onPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openWeb(String url) async {
    Get.back();
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      Get.snackbar(
        'Gagal membuka URL',
        'Tidak dapat membuka $url',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  int getAllSiteDataLength() {
    return SiteModel.getAllSiteData.length;
  }

  void handleBack() {
    Get.back();
  }

  void handleFavClick() {
    Get.toNamed(RouteName.siteFavorite);
  }
}
