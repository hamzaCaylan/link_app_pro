import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/my_button.dart';
import '../../category/category_constants.dart';
import '../../linkcard/linkcard.dart';

final TextEditingController groupyName = TextEditingController();

class GroupAddPage extends StatefulWidget {
  const GroupAddPage({Key? key}) : super(key: key);

  @override
  State<GroupAddPage> createState() => _GroupAddPageState();
}

class _GroupAddPageState extends State<GroupAddPage> {
  bool open = false;
  late String groupTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Grup olustur'), backgroundColor: CategoryColors.opicswallowBlue),
      backgroundColor: CategoryColors.benthicBlack,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 4,
            ),
            Padding(
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
                            'Grup Olustur',
                            style: TextStyle(color: CategoryColors.midasFingerGold, fontSize: 16),
                          ),
                          Text(
                            "Yeni bir grup olustur",
                            style: TextStyle(color: CategoryColors.zhebZhuBaiPearl.withOpacity(0.9), fontSize: 13),
                          ),
                        ],
                      ),
                      value: "Grup Olustur",
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
                            "Gruba Katıl",
                            style: TextStyle(color: CategoryColors.midasFingerGold, fontSize: 16),
                          ),
                          Text(
                            "Var olan bir gruba katıl",
                            style: TextStyle(color: CategoryColors.zhebZhuBaiPearl.withOpacity(0.9), fontSize: 13),
                          ),
                        ],
                      ),
                      value: "Gruba Katıl",
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
            ),
            gender != 'Grup Olustur' ? const SizedBox() : groupOlustur(),
            gender != 'Gruba Katıl' ? const SizedBox() : groupKatil(),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox groupOlustur() {
    return SizedBox(
      child: Column(children: [
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
        MyButton(
          title: 'Temizle',
          onPress: () {
            setState(() {
              open = false;
            });
            groupyName.clear();
          },
          buttonColor: Colors.black,
          buttonIcon: const Icon(
            Icons.create,
            color: CategoryColors.midasFingerGold,
          ),
        )
      ]),
    );
  }

  SizedBox groupKatil() {
    return SizedBox(
      child: Column(children: [
        Container(
          height: 55,
          margin: textfieldmargin(),
          child: TextField(
            style: const TextStyle(fontSize: 14, color: CategoryColors.midasFingerGold),
            controller: groupyName,
            decoration: InputDecoration(
              labelText: 'Grup ID',
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
        open != false
            ? const SizedBox()
            : MyButton(
                title: 'Gruba Ara',
                onPress: () {
                  setState(() {
                    open = true;
                  });
                  /* Map<String, dynamic> demoData = {
              'Group title': groupyName.text.toString(),
              'id': groupyName.text.toString(),
            };
            CollectionReference collectionReference = FirebaseFirestore.instance.collection('Link').doc(emaill).collection('Grup');
            collectionReference.add(demoData);
            //Navigator.pop(context);*/
                },
                buttonColor: Colors.black,
                buttonIcon: const Icon(
                  Icons.create,
                  color: CategoryColors.midasFingerGold,
                ),
              ),
        open == false
            ? const SizedBox()
            : MyButton(
                title: 'ID temizle',
                onPress: () {
                  setState(() {
                    open = false;
                  });
                  groupyName.clear();
                },
                buttonColor: Colors.black,
                buttonIcon: const Icon(
                  Icons.create,
                  color: CategoryColors.midasFingerGold,
                ),
              ),
        open == false
            ? const SizedBox()
            : SizedBox(
                height: 190,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Grup').where("id", isEqualTo: groupyName.text.toString()).snapshots(), //
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      // ignore: prefer_is_empty
                      if (snapshot.data?.docs.length == 0) {
                        return const SizedBox();
                      } else {
                        return ListView.builder(
                          //  scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            var group = snapshot.data?.docs[index];
                            var grouptitle = group!['Group title'].toString();
                            var id = group['id'].toString();
                            groupTitle = grouptitle;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CategoryColors.opicswallowBlue,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                width: MediaQuery.of(context).size.width, //double.infinity,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const DontImageCart(
                                        iconrepead: true,
                                        title: 'Varsayilan ikon',
                                      ),
                                      Linkcarttitle(title: grouptitle),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      // ignore: prefer_interpolation_to_compose_strings
                                      Linkcarturl(url: 'Grup ID: ' + id),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            //
                          },
                        );
                      }
                    } else {
                      return const Text('Grup Yok');
                    }
                  },
                ),
              ),
        open == false
            ? const SizedBox()
            : MyButton(
                title: 'Gruba KatIl',
                onPress: () {
                  Map<String, dynamic> demoData = {
                    'Group title': groupTitle,
                    'id': groupyName.text.toString(),
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
      ]),
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
