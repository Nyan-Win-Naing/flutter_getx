import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/get_lesson/state_management/get_builder_controller.dart';

class GetBuilderExp extends StatelessWidget {
  final GetBuilderController controller = Get.put(
    GetBuilderController(),
    tag: "hi",
  );


  final GetBuilderController _controller = Get.put(
    GetBuilderController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetBuilder Exp"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<GetBuilderController>(
              id: "builder0",
              builder: (GetBuilderController control) {
                print("GetBuilder I build");
                return Text("GetBuilder I ${control.indexI}");
              },
            ),
            GetBuilder<GetBuilderController>(
              id: "builder1",
              builder: (GetBuilderController control) {
                print("GetBuilder II build");
                return Text("GetBuilder II ${control.indexI}");
              },
            ),
            GetBuilder<GetBuilderController>(
              tag: "hi",
              id: "builder2",
              initState: (GetBuilderState<GetBuilderController> control) {
                print("builder2 init state ${control.controller}");
                control.controller?.randomIndex(["builder2"]);
              },
              filter: (GetBuilderController control) {
                print("builder 2 filter $control");
                return control.indexI > 100000
                    ? control.indexI.value = 999999
                    : control.indexI.value = 111;
              },
              dispose: (GetBuilderState<GetBuilderController> control) {
                print("dispose");
              },
              builder: (GetBuilderController control) {
                print("GetBuilder III build");
                return Text("GetBuilder III ${control.indexI}");
              },
            ),
            SizedBox(height: 100),
            Obx(
              () {
                print("widget 1 is build");
                return Text("Widget 1 ${controller.indexI.toString()}");
              },
            ),
            Obx(
              () {
                print("widget 2 is build");
                return Text("Widget 2 ${controller.indexI.toString()}");
              },
            ),
            Obx(
              () {
                print("widget 3 is build");
                return Text("Widget 3 ${controller.indexI.toString()}");
              },
            ),
            Obx(
              () {
                print("widget 4 is build");
                return Text("Widget 4 ${controller.indexI.toString()}");
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.randomIndex(["builder${Random().nextInt(3)}"]);
                // controller.randomIndex(["builder2"]);
              },
              child: Text("Random"),
            ),
          ],
        ),
      ),
    );
  }
}
