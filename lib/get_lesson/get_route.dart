import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/get_lesson/binding/binding.dart';
import 'package:get_flutter/get_lesson/get_second_page.dart';

class GetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Route Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Get.to(GetSecondPage());
            // Get.off(GetSecondPage());
            Get.toNamed("/second", arguments: "hello");

            /// Snack Bar
            // Get.snackbar(
            //   "title",
            //   "message",
            //   snackPosition: SnackPosition.BOTTOM,
            //   backgroundColor: Colors.grey,
            // );

            /// Dialog
            // Get.defaultDialog();

            // print(await Get.dialog(
            //   AlertDialog(
            //     title: Text("Hello"),
            //     actions: [
            //       TextButton(
            //         onPressed: () => Get.back(result: "Hi"),
            //         child: Text(
            //           "hello",
            //         ),
            //       ),
            //     ],
            //   ),
            // ));

            /// Bottom Sheet
            // Get.bottomSheet(
            //   Container(
            //     color: Colors.greenAccent,
            //   ),
            // );
          },
          child: Text(
            "Go To Second Page",
          ),
        ),
      ),
    );
  }
}
