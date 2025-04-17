import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/models/about_model.dart';
import 'package:tugas3_mobile_teori/core/services/session_service.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final SessionService _sessionService = Get.find<SessionService>();

    List<AboutModel> helpContent = AboutModel.getHelpContent();

    return DefaultTabController(
      length: helpContent.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bantuan Page'),
          actions: [
            IconButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Konfirmasi Logout'),
                    content: const Text('Apakah Anda yakin ingin logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          _sessionService.logout().then(
                            (v) {
                              Get.offAllNamed('/login');
                            },
                            onError: (e) {
                              Get.snackbar(
                                'Error!',
                                'Something went wrong. Please try again.',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                icon: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              );
                            },
                          );
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ],
          backgroundColor: Colors.green,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: helpContent
                .map((content) => Tab(
                      text: content.title,
                    ))
                .toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: helpContent.map((content) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          content.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Content
                      Text(
                        content.content,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
