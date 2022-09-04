import 'package:flutter/material.dart';

import '../../../screen/navigator.dart';
import '../../button/my_button.dart';
import '../../showmessage/show_message.dart';
import '../category_constants.dart';

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
            const SizedBox(
              height: 150,
            ),
            Container(
              height: 55,
              margin: textfieldmargin(),
              child: TextField(
                style: const TextStyle(fontSize: 14, color: CategoryColors.midasFingerGold),
                //controller: controller,
                decoration: InputDecoration(
                  labelText: 'Categori Baslik',
                  labelStyle: const TextStyle(color: CategoryColors.zhebZhuBaiPearl),
                  filled: true,
                  fillColor: CategoryColors.opicswallowBlue,
                  enabledBorder: textfieldenabelborder(),
                  focusedBorder: textfieldfocusborder(),
                ),
                onChanged: (context) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
            )
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
        undertitle: '.....Adli yeni kategori eklendi BOSSSS ',
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
