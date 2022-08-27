import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants.dart';
import '../linkcard/linkcard.dart';

class LinkListDetail extends StatefulWidget {
  const LinkListDetail({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<LinkListDetail> createState() => _LinkListDetailState();
}

class _LinkListDetailState extends State<LinkListDetail> {
  final String emaill = 'hamza@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyCustomerColors.benthicBlack,
        title: Text(widget.category),
      ),
      body: Container(
        color: MyCustomerColors.deepWater,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/00.webp'), fit: BoxFit.cover)),
            ),
            StreamBuilder(
              //stream: FirebaseFirestore.instance.collection('Link').doc(emaill).collection('Link').snapshots(), //
              stream: FirebaseFirestore.instance
                  .collection('Link')
                  .doc(emaill)
                  .collection('Link')
                  .where("Link Kategori ", isEqualTo: widget.category)
                  .snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  // ignore: prefer_is_empty
                  if (snapshot.data?.docs.length == 0) {
                    return const LoadingSpace();
                  } else {
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
                  }
                } else {
                  return const LoadingSpace();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingSpace extends StatelessWidget {
  const LoadingSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Lottie.asset(
            'assets/lotties/space0.json',
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

  //      width: MediaQuery.of(context).size.width,
