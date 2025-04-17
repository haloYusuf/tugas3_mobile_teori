import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/number/number_controller.dart';
import 'package:flutter/services.dart';

class NumberView extends StatelessWidget {
  const NumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberController controller = Get.put(NumberController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Number Detection'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: controller.handleBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan angka untuk cek jenis bilangan',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: controller.numberController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  if (newValue.text.contains(',')) {
                    return oldValue; // biar gbs koma
                  }
                  return newValue;
                }),
              ],
              decoration: const InputDecoration(
                hintText: 'Masukkan Angka',
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // tombol cek
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.checkNumber,
                child: const Text('Cek Bilangan'),
              ),
            ),
            const SizedBox(height: 16),

            // error handling
            Obx(() {
              if (controller.errorMessage.value.isNotEmpty) {
                return Text(
                  'Error: ${controller.errorMessage.value}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),

            // kotak hasil
            Obx(() {
              if (controller.result.value.isNotEmpty) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withAlpha(20),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.result.value,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Menampilkan jenis bilangan
                      if (controller.isBulat.value)
                        const Text('Bilangan Bulat'),
                      if (controller.isPositif.value)
                        const Text('Bilangan Positif'),
                      if (controller.isCacah.value)
                        const Text('Bilangan Cacah'),
                      if (controller.isNegatif.value)
                        const Text('Bilangan Negatif'),
                      if (controller.isPrima.value)
                        const Text('Bilangan Prima'),
                      if (controller.isDesimal.value)
                        const Text('Bilangan Desimal'),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
