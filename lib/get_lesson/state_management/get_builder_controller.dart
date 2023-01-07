import 'dart:math';

import 'package:get/get.dart';

class GetBuilderController extends GetxController {
  final RxInt indexI = 0.obs;

  void randomIndex([List<Object>? ids]) {
    indexI.value = Random.secure().nextInt(999999);
    update(ids);
  }
}