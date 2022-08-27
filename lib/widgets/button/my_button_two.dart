import 'package:flutter/material.dart';
import 'my_button_constants.dart';

class MyButtonTwo extends StatelessWidget {
  const MyButtonTwo({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        decoration: MyButtonDeco.myButtonDeco,
        height: 60,
        width: 320,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: MyTextStyle.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
