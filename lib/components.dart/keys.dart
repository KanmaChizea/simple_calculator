import 'package:flutter/material.dart';

class CustomKeys extends StatelessWidget {
  const CustomKeys({
    Key? key,
    required this.keyname,
    required this.onTapped,
  }) : super(key: key);

  final String keyname;
  final Function()? onTapped;

  bool specialCharacter(String character) {
    switch (character) {
      case 'C':
        return true;
      case '%':
        return true;
      case '+':
        return true;
      case 'DEL':
        return true;
      case '=':
        return true;
      case '\u2014':
        return true;

      case '\u00D7':
        return true;
      case '\u00F7':
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSpecialCharacter = specialCharacter(keyname);
    return GestureDetector(
      child: SizedBox(
        width: 50,
        child: Center(
            child: Text(keyname,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: isSpecialCharacter
                        ? const Color(0xffff5300)
                        : Theme.of(context).textTheme.bodyText1?.color))),
      ),
      onTap: onTapped,
    );
  }
}
