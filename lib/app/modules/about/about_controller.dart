import 'package:get/get.dart';
import 'package:tugas3_mobile_teori/app/models/about_model.dart';

class AboutController extends GetxController {
  List<AboutModel> getHelpContent() {
    return AboutModel.getHelpContent();
  }
}
