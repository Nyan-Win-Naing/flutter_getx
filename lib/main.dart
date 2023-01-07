import 'package:flutter/material.dart';
import 'package:get_flutter/get_lesson/get_builder_exp.dart';
import 'package:get_flutter/get_lesson/get_controller_exp.dart';
import 'package:get_flutter/get_lesson/get_dependency.dart';
import 'package:get_flutter/get_lesson/rx_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: GetControllerExp(),
      // home: GetBuilderExp(),
      home: GetDependency(),
    );
  }
}
