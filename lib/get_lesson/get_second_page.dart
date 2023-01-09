import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/get_lesson/binding/binding.dart';

class GetSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Second Page"),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            // print(Get.find<GenerateColor>(tag: "red").color);
            print(Get.find<GenerateColor>(tag: "blue").color);
            // Get.back();
          },
          child: Text(
            "hello",
            // Get.find<GenerateColor>(tag: "red").color,
          ),
        ),
      ),
    );
  }
}
