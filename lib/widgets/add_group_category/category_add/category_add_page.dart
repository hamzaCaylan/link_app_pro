import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../button/my_button.dart';
import '../../showmessage/show_message.dart';
import '../../category/category_constants.dart';

final TextEditingController categoryName = TextEditingController();
// ignore: prefer_typing_uninitialized_variables
var a;

class CategoryAddPage extends StatelessWidget {
  const CategoryAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Category'), backgroundColor: CategoryColors.opicswallowBlue),
      backgroundColor: CategoryColors.benthicBlack,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 4,
            ),
            Container(
              height: 55,
              margin: textfieldmargin(),
              child: TextField(
                style: const TextStyle(fontSize: 14, color: CategoryColors.midasFingerGold),
                controller: categoryName,
                decoration: InputDecoration(
                  labelText: 'Categori Baslik',
                  labelStyle: const TextStyle(color: CategoryColors.zhebZhuBaiPearl),
                  filled: true,
                  fillColor: CategoryColors.opicswallowBlue,
                  enabledBorder: textfieldenabelborder(),
                  focusedBorder: textfieldfocusborder(),
                ),
                onChanged: (context) {
                  a = categoryName.text.toString();
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const RadioList(),
            MyButton(
              title: 'Olustur',
              onPress: () {
                Navigator.pop(context);
                addMessage(context);
              },
              buttonColor: Colors.black,
              buttonIcon: const Icon(
                Icons.create,
                color: CategoryColors.midasFingerGold,
              ),
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> addMessage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => MyAlertWidget(
        title: 'Yeni kategory eklendi',
        undertitle: '$a adli yeni kategori eklendi BOSSSS ',
        luttie: 'assets/lotties/ok.json',
        repeat: false,
        onPress: () {
          Navigator.pop(context);
        },
        onPressTwoSee: false,
        onPressTwo: () {},
      ),
    );
  }

  OutlineInputBorder textfieldfocusborder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: CategoryColors.zhebZhuBaiPearl));
  }

  OutlineInputBorder textfieldenabelborder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: CategoryColors.transparent));
  }

  EdgeInsets textfieldmargin() => const EdgeInsets.only(left: 10, right: 10);
}

class RadioList extends StatefulWidget {
  const RadioList({Key? key}) : super(key: key);
  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: CategoryColors.opicswallowBlue,
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              activeColor: CategoryColors.midasFingerGold,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Liste Disi",
                    style: TextStyle(color: CategoryColors.midasFingerGold, fontSize: 16),
                  ),
                  Text(
                    "Baglantiyi bilen herkes gorebilir",
                    style: TextStyle(color: CategoryColors.zhebZhuBaiPearl.withOpacity(0.9), fontSize: 13),
                  ),
                ],
              ),
              value: "Liste Disi",
              groupValue: gender,
              onChanged: (value) {
                setState(
                  () {
                    gender = value.toString();
                  },
                );
              },
            ),
            RadioListTile(
              activeColor: CategoryColors.midasFingerGold,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gizli",
                    style: TextStyle(color: CategoryColors.midasFingerGold, fontSize: 16),
                  ),
                  Text(
                    "Yalnizca siz gorebilirsiniz",
                    style: TextStyle(color: CategoryColors.zhebZhuBaiPearl.withOpacity(0.9), fontSize: 13),
                  ),
                ],
              ),
              value: "Gizli",
              groupValue: gender,
              onChanged: (value) {
                setState(
                  () {
                    gender = value.toString();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
