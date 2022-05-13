import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/components.dart/keyboard.dart';
import 'package:simple_calculator/state%20management/controller.dart';
import 'package:simple_calculator/state%20management/theme.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<CalculatorParameter>(CalculatorParameter());
    final themeController = Get.put<ThemeController>(ThemeController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Simple Calculator',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  Get.find<ThemeController>().changeTheme();
                  final _theme = themeController.themeData.value;
                  Get.changeTheme(_theme);
                },
                icon: themeController.icon.value))
          ],
        ),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              width: size.width,
              height: size.height / 3,
              child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        controller.userinput.value,
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.answer.value,
                        style: const TextStyle(
                          fontSize: 40,
                          //   fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ))),
          const Divider(
            thickness: 1.2,
          ),
          const Flexible(child: CustomKeyboard())
        ]));
  }
}
