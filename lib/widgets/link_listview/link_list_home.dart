import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants.dart';
import '../linkcard/linkcard.dart';

class LinkListHome extends StatefulWidget {
  const LinkListHome({Key? key}) : super(key: key);

  @override
  State<LinkListHome> createState() => _LinkListHomeState();
}

class _LinkListHomeState extends State<LinkListHome> {
  final String emaill = 'hamza@gmail.com';
  var refFireBase = FirebaseFirestore.instance.collection('Link').doc('hamza@gmail.com').collection('Link');
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
              stream: refFireBase.snapshots(), //
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  // ignore: prefer_is_empty
                  if (snapshot.data?.docs.length == 0) {
                    return const LoadingSpacee();
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var link = snapshot.data?.docs[index];
                        var linkid = snapshot.data?.docs[index].id.toString();
                        var title = link!['Link Baslik'].toString();
                        var image = link['Link Image'].toString();
                        var url = link['Link URL'].toString();
                        return Linkcard(
                          title: title,
                          image: image,
                          url: url,
                          id: linkid!,
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
          ),
        )
      ],
    );
  }
}

class LoadingSpacee extends StatelessWidget {
  const LoadingSpacee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Lottie.asset(
            'assets/lotties/space.json',
            repeat: true,
          ),
        ),
        const Text(
          'Kayitli Link bulunmuyor!!!',
          style: TextStyle(fontSize: 18, color: MyCustomerColors.midasFingerGold),
        )
      ],
    );
  }
}
// ,
