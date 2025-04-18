import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/core/constants/string_constant.dart';

class MemberController extends GetxController {
  final teamMembers = <Map<String, String>>[
    {
      'nama': 'Diandra Yusuf A.',
      'nim': '123220031',
      'imagePath': '${StringConstant.pathImageAsset}/yusuf.jpg',
    },
    {
      'nama': 'Salma Hanifa',
      'nim': '123220019',
      'imagePath': '${StringConstant.pathImageAsset}/salma.jpg',
    },
    {
      'nama': 'Erlltya Rachma A.',
      'nim': '123220008',
      'imagePath': '${StringConstant.pathImageAsset}/lita.jpg',
    },
  ].obs;
}