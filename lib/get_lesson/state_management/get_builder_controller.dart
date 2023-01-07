import 'dart:math';

import 'package:get/get.dart';

class GetBuilderController extends GetxController {
  final RxInt indexI = 0.obs;
  final RxInt index2 = 0.obs;
  final RxInt index3 = 0.obs;

  GetBuilderController(int i) {
    indexI.value = i;
    print("GetBuilderController => main $indexI");
  }

  @override
  void onInit() {
    super.onInit();
    indexI.value = 10;
    print("GetBuilderController => OnInit $indexI");

    /// Ever
    // ever(
    //   indexI,
    //   (e) {
    //     print("ever is called with $e");
    //   },
    // );

    /// Ever All
    // everAll(
    //   [
    //     indexI,
    //     index2
    //   ],
    //   (e) {
    //     print("ever all is called with $e");
    //   },
    // );

    /// Once
    // once(
    //   index2,
    //   (e) {
    //     print("index2 is changed");
    //   },
    // );

    /// Debounce
    // debounce(
    //   index3,
    //   (e) {
    //     print("index is work with $e");
    //   },
    //   time: Duration(seconds: 1),
    // );

    /// Interval
    interval(
      index3,
      (e) {
        print("index 3 is work with $e");
      },
      time: Duration(seconds: 3),
    );
  }

  @override
  void onReady() {
    super.onReady();
    indexI.value = 20;
    print("GetBuilderController => OnReady $indexI");
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    super.update(ids, condition);
    print("GetBuilderController Update....");
  }

  void randomIndex([List<Object>? ids]) {
    // indexI.value = Random.secure().nextInt(999999);
    // index2.value = Random.secure().nextInt(999999);
    // index3.value = Random.secure().nextInt(999999);
    index3.value += 1;
    print("Index 3 is ====> ${index3.value}");
    // update(ids);
  }
}
