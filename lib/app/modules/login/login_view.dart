import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/modules/login/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
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
                  'Welcome To,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'MultiApp',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                Text(
                  'Aplikasi dengan berbagai macam fitur.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Login sebelum masuk aplikasi!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextField(
                    controller: controller.userNameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Username / Email',
                      errorText: controller.getUserNameErrorStatus()
                          ? 'Username tidak boleh kosong!'
                          : null,
                    ),
                  ),
                ),
                Obx(
                  () => TextField(
                    controller: controller.passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !controller.getVisibilityStatus(),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: controller.getPasswordStatus()
                          ? 'Password Salah!'
                          : null,
                      suffixIcon: IconButton(
                        onPressed: controller.handleVisibility,
                        icon: Icon(
                          !controller.getVisibilityStatus()
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.handleLogin,
                  child: Text(
                    'Masuk',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
