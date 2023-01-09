import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/get_lesson/binding/binding.dart';
import 'package:get_flutter/get_lesson/not_found_page.dart';

class FirstMiddleware extends GetMiddleware {

  @override
  // TODO: implement priority
  int? get priority => -1;

  @override
  GetPage? onPageCalled(GetPage? page) {
    print("FirstMiddleware is called.");
    // if (page?.arguments == null) {
    //   return GetPage(
    //     name: "/404",
    //     page: () => NotFoundPage(),
    //   );
    // }
    return super.onPageCalled(page);
  }


  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    print(bindings);
    final List<Bindings> _bindings = [];
    if(bindings != null) {
      for(var binding in bindings) {
        if(binding is SecondBinding) {
          _bindings.add(binding);
        }
      }
    }
    return _bindings;
  }

  @override
  RouteSettings? redirect(String? route) {
    print("Redirect is Called");
    return super.redirect("/third");
    // return RouteSettings(name: "/third");
  }
}

class SecondMiddleware extends GetMiddleware {
  @override
  // TODO: implement priority
  int? get priority => 2;

  @override
  GetPage? onPageCalled(GetPage? page) {
    print("SecondMiddleware is called.");
    return super.onPageCalled(page);
  }
}
