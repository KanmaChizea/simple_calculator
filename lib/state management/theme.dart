import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeData = ThemeData.light().obs;
  var icon = const Icon(Icons.dark_mode, color: Colors.black).obs;

  changeTheme() {
    if (themeData.value == ThemeData.light()) {
      themeData.value =
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black);
      icon.value = const Icon(
        Icons.light_mode,
        color: Color(0xffff5300),
      );
      update();
    } else {
      themeData.value = ThemeData.light();
      icon.value = const Icon(Icons.dark_mode, color: Colors.black);
      update();
    }
  }
}
