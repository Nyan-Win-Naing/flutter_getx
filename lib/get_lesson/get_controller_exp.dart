import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/get_lesson/state_management/get_controller.dart';

class GetControllerExp extends StatelessWidget {
  // final GetStateManagement _state = GetStateManagement();

  final GetStateManagement _state = Get.put(GetStateManagement());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Controller Exp 1"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(_state.name.value)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetControllerExp2(),
                  ),
                );
              },
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _state.name.value = "aung aung";
        },
      ),
    );
  }
}

class GetControllerExp2 extends StatelessWidget {
  // final GetStateManagement _state = GetStateManagement();

  final GetStateManagement _state = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Controller Exp 2"),
      ),
      body: Center(
        child: Obx(() => Text(_state.name.value)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _state.name.value = "Hello World";
        },
      ),
    );
  }
}
