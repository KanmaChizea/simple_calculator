import 'package:get/get.dart';

class CalculatorParameter extends GetxController {
  var userinput = ''.obs;
  var answer = '0'.obs;

  updateUserInput(String x) {
    userinput.value += x;
    update();
  }

  updateAnswer(String x) {
    if (x.contains('.')) {
      List format = x.split('.');
      if (format[1] == '0') {
        answer.value = '= ${format[0]}';
      } else {
        answer.value = '= $x';
      }
    } else {
      answer.value = '= $x';
    }
    update();
  }

  delete() {
    userinput.value = userinput.value.substring(0, userinput.value.length - 1);
    update();
  }

  clearAll() {
    userinput.value = '';
    answer.value = '0';
    update();
  }
}
