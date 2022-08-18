import 'package:flutter/material.dart';
import '../../constants.dart';

////text on tab ozeeligine bakilacak

final TextEditingController linkurlcontroller = TextEditingController();

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.controller,
      //required myonchanged,
      required this.myonchangedaaaa,
      required this.obscureText});
  final String title;
  final TextEditingController controller;
  final VoidCallback myonchangedaaaa;
  final bool obscureText;
  void myonchanged(value) {
    myonchangedaaaa();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: textfieldmargin(),
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(fontSize: 14, color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(color: MyCustomarColors.zhebZhuBaiPearl),
          filled: true,
          fillColor: MyCustomarColors.deepWater,
          enabledBorder: textfieldenabelborder(),
          focusedBorder: textfieldfocusborder(),
        ),
        onChanged: myonchanged,
      ),
    );
  }

  OutlineInputBorder textfieldfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyCustomarColors.crystalBell));
  }

  OutlineInputBorder textfieldenabelborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: MyCustomarColors.crystalBell));
  }

  EdgeInsets textfieldmargin() => const EdgeInsets.only(left: 10, right: 10);
}
