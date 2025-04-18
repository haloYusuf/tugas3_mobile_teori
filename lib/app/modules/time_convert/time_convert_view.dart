import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/time_convert/time_convert_controller.dart';
import 'package:tugas3_mobile_teori/core/constants/color_constant.dart';

class TimeConvertView extends StatelessWidget {
  const TimeConvertView({super.key});

  @override
  Widget build(BuildContext context) {
    TimeConvertController controller = Get.put(TimeConvertController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.handleBack,
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Time Convertion',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  'Masukkan Total Waktu (Dalam Tahun) : ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextField(
                  controller: controller.inputController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    controller.setDecimalInputFormater(),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Masukkan total tahun',
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.handleHitung,
                  child: Text(
                    'Konversi',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Obx(
                  () => controller.isShowAnswer.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                controller.resultAnswer.value,
                                style: TextStyle(
                                  color: ColorConstant.onPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
