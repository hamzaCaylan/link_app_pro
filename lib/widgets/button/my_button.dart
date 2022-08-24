import 'package:flutter/material.dart';
import 'my_button_constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.buttonIcon,
    required this.buttonColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  final Icon buttonIcon;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        decoration: MyButtonDeco.myButtonDeco,
        height: 60,
        width: 320,
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: buttonIcon,
            ),
            const Spacer(),
            Text(
              title,
              style: MyTextStyle.textStyle,
            ),
            const Spacer(
              flex: 15,
            ),
          ],
        ),
      ),
    );
  }
}
