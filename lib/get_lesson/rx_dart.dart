import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/get_lesson/state_management/get_controller.dart';

class StringName {
  final int i;

  StringName(this.i);
}

enum Greet { hello, hi }

class RxDartExp extends StatelessWidget {

  final RxString name = "mg mg".obs;
  // final String string = "mg mg";

  final RxInt i = 0.obs;
  final Rx<Greet> greet = Greet.hello.obs;

  final RxList a = [
    "mg mg",
    "aung aung",
    "su su",
  ].obs;

  final RxMap b = {
    "name": "mg mg",
    "age": 20,
  }.obs;

  final Rx<StringName> s = StringName(0).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxDart Exp"),
      ),
      body: Center(
        child: Obx(
          () => Text(
            // s.value.i.toString(),
            greet.value.toString(),
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // s.value = StringName(s.value.i + 1);

          // for(RxInt i = 0.obs; i.value < 10; i.value ++) {
          //   print(i.value);
          // }

          // a.forEach((element) {
          //   print(element);
          // });

          b.forEach((key, value) {
            print(key);
            print(value);
          });
        },
      ),
    );
  }
}
