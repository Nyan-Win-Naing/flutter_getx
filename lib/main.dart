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
import 'package:get_flutter/get_lesson/translation.dart';

class MyTheme {
  static ThemeData light() => ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.amber),
      trackColor: MaterialStateProperty.all(Colors.grey),
    ),
  );

  static ThemeData dark() => ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.green),
      trackColor: MaterialStateProperty.all(Colors.white),
    ),
  );
}

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
      theme: MyTheme.light(),
      darkTheme: MyTheme.dark(),
      themeMode: ThemeMode.system,
      locale: Locale("Myanmar"),
      fallbackLocale: Locale("English"),
      translations: MyTranslation(),
      // home: GetControllerExp(),
      // home: GetBuilderExp(),
      // home: GetDependency(),
      // home: GetRoute(),
      // home: GetThemeChange(),
      home: GetTranslationPage(),
    );
  }
}

class GetThemeChange extends StatelessWidget {

  final RxBool isLight = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => Switch(
            value: isLight.value,
            onChanged: (e) {
              isLight.value = !isLight.value;
              if(isLight.value) {
                Get.changeTheme(MyTheme.light());
              } else {
                Get.changeTheme(MyTheme.dark());
              }
            },
          ),
        ),
      ),
    );
  }
}
