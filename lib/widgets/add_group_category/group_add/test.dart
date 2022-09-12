import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../category/category_constants.dart';
import '../../link_listview/link_list_home.dart';
import '../../linkcard/linkcard.dart';

final TextEditingController groupyid = TextEditingController();

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var refFireBase = FirebaseFirestore.instance.collection('Grup').where("id", isEqualTo: 'iC938cHR3HEqEHih3wey');
  // var refFireBase = FirebaseFirestore.instance.collection('Link').doc('hamza@gmail.com').collection('Gruplar');
  // ignore: prefer_typing_uninitialized_variables
  var id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 350,
      //width: 200,
      child: StreamBuilder(
        stream: refFireBase.snapshots(), //
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
                  id = group['id'].toString();
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
                            Linkcarturl(url: id),
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
            return const LoadingSpacee();
          }
        },
      ),
    );
  }
}
/*const Spacer(
          flex: 4,
        ),
        SizedBox(
          height: 55,
          child: TextField(
            style: const TextStyle(fontSize: 14, color: CategoryColors.midasFingerGold),
            controller: groupyid,
            decoration: const InputDecoration(
              labelText: 'Grup Baslik',
              labelStyle: TextStyle(color: CategoryColors.zhebZhuBaiPearl),
              filled: true,
              fillColor: CategoryColors.opicswallowBlue,
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
            Map<String, dynamic> demoData = {
              'Group title': 'ali',
              'id': groupyid.text.toString(),
            };
            CollectionReference collectionReference = FirebaseFirestore.instance.collection('Link').doc('hamza@gmail.com').collection('Gruplar');
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
        ), */