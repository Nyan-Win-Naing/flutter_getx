import 'package:get/get.dart';

class GenerateColor {
  final String color;

  GenerateColor(this.color);
}

class FirstBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put("hello");
    // Get.put([]);

    Get.lazyPut(() => GenerateColor("red"), tag: "red");
  }
}

class SecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenerateColor("blue"), tag: "blue");
  }

}