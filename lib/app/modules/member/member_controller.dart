import 'package:get/get.dart';

class MemberController extends GetxController {
  final teamMembers = <Map<String, String>>[
    {
      'nama': 'Diandra Yusuf A.',
      'nim': '123220031',
      'imagePath': 'assets/images/yusuf.jpg',
    },
    {
      'nama': 'Salma Hanifa',
      'nim': '123220019',
      'imagePath': 'assets/images/salma.jpg',
    },
    {
      'nama': 'Erlltya Rachma A.',
      'nim': '123220008',
      'imagePath': 'assets/images/lita.jpg',
    },
  ].obs;
}