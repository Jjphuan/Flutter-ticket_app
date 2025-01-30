import 'package:get/get.dart';

class ExpandTextController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
