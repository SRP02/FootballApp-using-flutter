import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // contains all logical operations metods and variables
  var selectedIndex = 0.obs;

  void changeIndexMenu(int index) {
    selectedIndex.value = index;
  }
}