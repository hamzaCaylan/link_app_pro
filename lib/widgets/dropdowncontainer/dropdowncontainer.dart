import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../button/my_button.dart';

class UrlContainer extends StatelessWidget {
  const UrlContainer(
      {Key? key, required this.linkBaslik, required this.linkURL, required this.linAciklama, required this.linkImage, required this.linkCatagory})
      : super(key: key);
  final String linkBaslik;
  final String linkURL;
  final String linAciklama;
  final String linkImage;
  final String linkCatagory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 3),
              child: SizedBox(
                width: 300,
                child: Text(
                  'Resim',
                  style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                width: 330,
                height: 190,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(linkImage), fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            const SizedBox(
              width: 300,
              child: Text(
                'Bilgiler ',
                style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                width: 330,
                height: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 170,
                      width: 290,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Baslik : ',
                                  style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
                                ),
                                Expanded(
                                    child: Text(
                                  linkBaslik,
                                  style: const TextStyle(fontFamily: 'sHeader', fontSize: 13, color: MyCustomarColors.midasFingerGold),
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Katagori : ',
                                  style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
                                ),
                                Expanded(
                                    child: Text(
                                  linkCatagory,
                                  style: const TextStyle(fontFamily: 'sHeader', fontSize: 13, color: MyCustomarColors.midasFingerGold),
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Url   : ',
                                  style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
                                ),
                                Expanded(
                                    child: Text(
                                  linkURL,
                                  style: const TextStyle(fontFamily: 'sHeader', fontSize: 13, color: MyCustomarColors.midasFingerGold),
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Aciklama : ',
                                  style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
                                ),
                                Expanded(
                                    child: Text(
                                  linAciklama,
                                  style: const TextStyle(fontFamily: 'sHeader', fontSize: 13, color: MyCustomarColors.midasFingerGold),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        MyButton(
          title: 'Link Kaydet',
          buttomIcon: const Icon(Icons.save_as, size: 24.0, color: MyCustomarColors.midasFingerGold),
          buttomColor: MyCustomarColors.benthicBlack,
          onPress: () {
            // print(Link_Baslik+LinkURL+Link_Aciklmama+Link_Catagory);
            Map<String, dynamic> demoData = {
              "Link Baslik": linkBaslik,
              "Link URL": linkURL,
              "Link Kategori ": linkCatagory,
              "Link Aciklama": linAciklama,
              "Link Image": linkImage,
            };
            //CollectionReference collectionReference = FirebaseFirestore.instance.collection('Doc-MAK').doc('$email').collection('yayin').doc('$yayinturu').collection('$yayinalan');collectionReference.add(demoData);
            CollectionReference collectionReference = FirebaseFirestore.instance.collection('Link').doc('emaill').collection('Link');
            // CollectionReference collectionReference = FirebaseFirestore.instance.collection('Link').doc('emaill').collection('Link');
            collectionReference.add(demoData);
            //showerMessage(context);
          },
        )
      ],
    );
  }
}
