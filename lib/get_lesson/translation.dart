import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "Myanmar": {
          "greeting": "မင်ဂလာပါ",
          "name": "ကား",
        },
        "English": {
          "greeting": "hi",
          "name": "car",
        }
      };
}

class GetTranslationPage extends StatelessWidget {
  final List<String> languages = ["Myanmar", "English"];
  final RxString selected = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<String>(
            hint: Icon(Icons.language),
            value: selected.value.isEmpty ? null : selected.value,
            items: languages
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: (e) {
              selected.value = e ?? "";
              Get.updateLocale(Locale(e!));
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "name".tr,
        ),
      ),
    );
  }
}
