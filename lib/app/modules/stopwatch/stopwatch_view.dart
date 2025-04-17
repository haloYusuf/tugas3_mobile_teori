import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/stopwatch/stopwatch_controller.dart';

class StopwatchView extends StatelessWidget {
  const StopwatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final StopwatchController controller = Get.put(StopwatchController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: controller.handleBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 18,
              children: [
                const Text(
                  'Stopwatch',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        controller.elapsedTime.value,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: controller.toggleStopwatch,
                      child: Obx(() => Text(
                        controller.isRunning.value ? 'PAUSE' : 'START',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: controller.resetStopwatch,
                      child: const Text(
                        'RESET',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}