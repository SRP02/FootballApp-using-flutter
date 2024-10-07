import 'package:foot_balls_sport/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}