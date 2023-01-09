import 'package:flutter/material.dart';
import 'package:get_flutter/get_lesson/binding/binding.dart';
import 'package:get_flutter/get_lesson/get_builder_exp.dart';
import 'package:get_flutter/get_lesson/get_controller_exp.dart';
import 'package:get_flutter/get_lesson/get_dependency.dart';
import 'package:get_flutter/get_lesson/get_route.dart';
import 'package:get_flutter/get_lesson/get_second_page.dart';
import 'package:get_flutter/get_lesson/get_third_page.dart';
import 'package:get_flutter/get_lesson/middleware/middleware.dart';
import 'package:get_flutter/get_lesson/rx_dart.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // navigatorKey: Get.key,
      getPages: [
        GetPage(
          name: "/second",
          page: () => GetSecondPage(),
          arguments: "hello",
          // binding: FirstBinding(),
          bindings: [
            FirstBinding(),
            SecondBinding(),
          ],
          middlewares: [
            SecondMiddleware(),
            FirstMiddleware(),
          ],
        ),
        GetPage(
          name: "/third",
          page: () => GetThirdPage(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: GetControllerExp(),
      // home: GetBuilderExp(),
      // home: GetDependency(),
      home: GetRoute(),
    );
  }
}
