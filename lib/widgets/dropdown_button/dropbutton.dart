import 'package:flutter/material.dart';
import 'drboxconstants.dart';

String? linkaciklmama;
String? linkcatagory = '';
String? linkimage = '';
String? katagory = '';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? value;
  final items = [
    'Haber',
    'Bilim',
    'Arastirma',
    'Kitap',
    'Hobi',
    'Eglence',
    'Craft',
    'Alisveris',
    'Film/Music',
    'Proje 1',
    'Proje 2',
    'Proje 3',
    'Proje 4',
    'Proje 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dropbuttondecor(),
      width: 330,
      height: 50,
      margin: dropbuttonpadding(),
      child: Padding(
        padding: dropbuttonpadding(),
        child: DropdownButton<String>(
          value: value,
          dropdownColor: DropDownButtonColors.black87,
          hint: Text(
            'Link Katagori',
            style: dropbuttontextstyle(),
          ),
          iconSize: 36,
          icon: const DropButtonIcon(),
          isExpanded: true,
          items: items.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() {
            this.value = value;
            linkcatagory = value;
          }),
        ),
      ),
    );
  }

  EdgeInsets dropbuttonpadding() => const EdgeInsets.only(left: 10, right: 10);

  TextStyle dropbuttontextstyle() {
    return const TextStyle(color: DropDownButtonColors.zhebZhuBaiPearl, fontSize: 14);
  }

  BoxDecoration dropbuttondecor() {
    return const BoxDecoration(
        color: DropDownButtonColors.benthicBlack,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(color: DropDownButtonColors.midasFingerGold, fontSize: 14),
        ),
      );
}

class DropButtonIcon extends StatelessWidget {
  const DropButtonIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.keyboard_arrow_down, color: DropDownButtonColors.midasFingerGold);
  }
}
