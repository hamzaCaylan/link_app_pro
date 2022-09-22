import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/my_button.dart';
import '../../category/category_constants.dart';

final TextEditingController groupyName = TextEditingController();

class GroupAddPage extends StatelessWidget {
  const GroupAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grup olustur'), backgroundColor: CategoryColors.opicswallowBlue),
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
                controller: groupyName,
                decoration: InputDecoration(
                  labelText: 'Grup Baslik',
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
              height: 10,
            ),
            MyButton(
              title: 'Olustur',
              onPress: () {
                String id = FirebaseFirestore.instance.collection('Grup').doc().id;
                FirebaseFirestore.instance.collection('Grup').doc(id).set({
                  'Group title': groupyName.text.toString(),
                  'id': id,
                });
                Map<String, dynamic> demoData = {
                  'Group title': groupyName.text.toString(),
                  'id': id,
                };
                CollectionReference collectionReference = FirebaseFirestore.instance.collection('Link').doc(emaill).collection('Grup');
                collectionReference.add(demoData);
                //Navigator.pop(context);
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

  OutlineInputBorder textfieldfocusborder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: CategoryColors.zhebZhuBaiPearl));
  }

  OutlineInputBorder textfieldenabelborder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: CategoryColors.transparent));
  }

  EdgeInsets textfieldmargin() => const EdgeInsets.only(left: 10, right: 10);
}
