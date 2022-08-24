import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../linkcard/linkcard.dart';

class LinkListHome extends StatefulWidget {
  const LinkListHome({Key? key}) : super(key: key);

  @override
  State<LinkListHome> createState() => _LinkListHomeState();
}

class _LinkListHomeState extends State<LinkListHome> {
  final String emaill = 'hamza@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Linklerim',
            style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomerColors.zhebZhuBaiPearl),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            decoration: const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 350,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Link').doc(emaill).collection('Link').snapshots(), //
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      var link = snapshot.data?.docs[index];
                      var title = link!['Link Baslik'].toString();
                      var image = link['Link Image'].toString();
                      var url = link['Link URL'].toString();
                      return Linkcard(
                        title: title,
                        image: image,
                        url: url,
                      );
                      //
                    },
                  );
                } else {
                  return const Center(child: Text("Kayıt bulunamadı"));
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
// ,
