import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Put {
  final String name;
  Put(this.name);
}

class PutAsync {
  final String name;
  PutAsync(this.name);
}

class Lazy {
  final String name;
  Lazy(this.name);
}

class GetDependency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Dependency Exp"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonView(
                label: "Put",
                onTap: () {
                  Get.put(Put("Put"));
                  // Get.put(
                  //   Put("Second Put"),
                  //   tag: "second",
                  // );
                  // Get.replace(Put("replace with new put"), tag: "second");
                  // Get.delete<Put>();
                  // Get.deleteAll();
                  // Get.reload<Put>(
                  //   force: false,
                  // );
                },
              ),
              ButtonView(
                label: "Find Put",
                onTap: () {
                  print(Get.find<Put>(
                          // tag: "second",
                          )
                      .name);
                },
              ),
              ButtonView(
                label: "isPrepared",
                onTap: () {
                  print(Get.isPrepared<Put>(
                    tag: "second",
                  ));
                },
              ),
              ButtonView(
                label: "isRegistered",
                onTap: () {
                  print(Get.isRegistered<Put>());
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonView(
                label: "lazyPut",
                onTap: () {
                  // Get.lazyPut(() => Lazy("lazyPut"));
                  // Get.lazyReplace(() => Lazy("replace with new lazy"));
                  Get.create(() => Put("Hello"));
                },
              ),
              ButtonView(
                label: "Find Lazy",
                onTap: () {
                  print(Get.find<Lazy>().name);
                },
              ),
              ButtonView(
                label: "isPrepared",
                onTap: () {
                  print(Get.isPrepared<Lazy>());
                },
              ),
              ButtonView(
                label: "isRegistered",
                onTap: () {
                  print(Get.isRegistered<Lazy>());
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonView(
                label: "putAsync",
                onTap: () {
                  Get.putAsync(
                    () async => Future.delayed(
                      Duration(seconds: 3),
                      () => PutAsync("putAsync"),
                    ),
                  );
                },
              ),
              ButtonView(
                label: "Find PutAsync",
                onTap: () {
                  print(Get.find<PutAsync>().name);
                },
              ),
              ButtonView(
                label: "isPrepared",
                onTap: () {
                  print(Get.isPrepared<PutAsync>());
                },
              ),
              ButtonView(
                label: "isRegistered",
                onTap: () {
                  print(Get.isRegistered<PutAsync>());
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonView(
                label: "lazyReplace",
                onTap: () {
                  // Get.lazyReplace(() => Lazy("Replace With New Lazy"));
                  Get.create(() => Put("Hello"));
                },
              ),
              ButtonView(
                label: "Find Replace",
                onTap: () {
                  print(Get.find<Put>().name);
                },
              ),
              ButtonView(
                label: "isPrepared",
                onTap: () {
                  print(Get.isPrepared<Put>());
                },
              ),
              ButtonView(
                label: "isRegistered",
                onTap: () {
                  print(Get.isRegistered<Put>());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  final String label;
  final Function onTap;

  ButtonView({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}
