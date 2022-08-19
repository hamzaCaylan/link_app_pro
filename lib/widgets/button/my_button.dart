import 'package:flutter/material.dart';
import 'my_button_constants.dart';

class AnaPage extends StatelessWidget {
  const AnaPage({
    Key? key,
    required this.title,
    required this.onPress,
    required this.buttomIcon,
    required this.buttomColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  final Icon buttomIcon;
  final Color buttomColor;
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
              child: buttomIcon,
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
