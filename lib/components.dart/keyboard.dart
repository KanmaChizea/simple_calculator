import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/components.dart/keys.dart';
import 'package:simple_calculator/state%20management/controller.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  bool isOperator(String character) {
    if (character == '\u00F7' ||
        character == '\u00D7' ||
        character == '+' ||
        character == '\u2014') {
      return true;
    } else {
      return false;
    }
  }

  evaluate(String input) {
    List bodmas = ['\u00F7', '\u00D7', '+', '\u2014'];
    List<String> splitInput = input.split(' ');

    //remove white spaces
    splitInput.forEach((element) => element.removeAllWhitespace);
    print(splitInput);
    while (splitInput.toSet().intersection(bodmas.toSet()).isNotEmpty) {
      for (int i = 0; i < 4; i++) {
        if (splitInput.contains(bodmas[i]) &&
            splitInput.indexOf(bodmas[i]) != splitInput.length - 1) {
          final index = splitInput.indexOf(bodmas[i]);

          num n = 0;

          switch (i) {
            case 0:
              n = num.parse(splitInput[index - 1]) /
                  num.parse(splitInput[index + 1]);
              break;
            case 1:
              n = num.parse(splitInput[index - 1]) *
                  num.parse(splitInput[index + 1]);
              break;
            case 2:
              n = num.parse(splitInput[index - 1]) +
                  num.parse(splitInput[index + 1]);
              break;
            case 3:
              n = num.parse(splitInput[index - 1]) -
                  num.parse(splitInput[index + 1]);
              break;
          }

          splitInput[index - 1] = n.toStringAsFixed(1);

          splitInput.removeRange(index, index + 2);
        }
      }
    }
    return splitInput.first;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalculatorParameter>();
    var answer = 0;
    List<String> keys = [
      '',
      'C',
      '%',
      '\u00F7',
      '7',
      '8',
      '9',
      '\u00D7',
      '4',
      '5',
      '6',
      '\u2014',
      '1',
      '2',
      '3',
      '+',
      'DEL',
      '0',
      '\u00B7',
      '='
    ];
    final size = MediaQuery.of(context).size;
    final itemHeight = size.height * 0.6 / 6;
    final itemWidth = size.width / 4;
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: itemWidth / itemHeight),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return CustomKeys(keyname: keys[index], onTapped: () {});
        } else if (index == 1) {
          return CustomKeys(
              keyname: keys[index], onTapped: () => controller.clearAll());
        } else if (index == 2) {
          return CustomKeys(
              keyname: keys[index],
              onTapped: () {
                final currentAnswer = evaluate(controller.userinput.value);
                controller
                    .updateAnswer((int.parse(currentAnswer) / 100).toString());
              });
        } else if (index == 16) {
          return CustomKeys(
              keyname: keys[index], onTapped: () => controller.delete());
        } else if (index == 18) {
          return CustomKeys(
              keyname: keys[index],
              onTapped: () => controller.updateUserInput('.'));
        } else if (index == 19) {
          return CustomKeys(
              keyname: keys[index],
              onTapped: () {
                final currentAnswer = evaluate(controller.userinput.value);
                controller.updateAnswer(currentAnswer);
              });
        } else {
          return CustomKeys(
              keyname: keys[index],
              onTapped: () {
                if (isOperator(keys[index])) {
                  controller.updateUserInput(' ${keys[index]} ');
                } else {
                  controller.updateUserInput(keys[index]);
                }
                final currentAnswer = evaluate(controller.userinput.value);
                controller.updateAnswer(currentAnswer);
              });
        }
      },
    );
  }
}
