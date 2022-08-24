import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets/dropdown_button/dropbutton.dart';
import 'widgets/textfield/textfield.dart';

String data = '';

class Xf extends StatefulWidget {
  const Xf({Key? key}) : super(key: key);

  @override
  State<Xf> createState() => _XfState();
}

// ignore: camel_case_types
class _XfState extends State<Xf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyCustomerColors.opicswallowBlue,
      body: Container(
        decoration: xfboxdecoration(),
        width: 330,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              title: "Link-URL",
              controller: linkurlcontroller,
              myonchangedaaaa: () async {
                data = linkurlcontroller.text.toString();
                // ignore: avoid_print
                print(data);
              },
              obscureText: false,
            ),
            const SizedBox(
              height: 5,
            ),
            const DropDownButton(),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration xfboxdecoration() {
    return const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)));
  }
}
