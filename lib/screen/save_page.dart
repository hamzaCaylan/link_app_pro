import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:link_app_pro/constants.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import '../widgets/button/my_button.dart';
import '../widgets/dropdown_button/dropbutton.dart';
import '../widgets/dropdowncontainer/dropdowncontainer.dart';

final TextEditingController linkController = TextEditingController();
final TextEditingController linkURLController = TextEditingController();
final TextEditingController linkAciklmamaController = TextEditingController();
final TextEditingController linkCatagoryController = TextEditingController();

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SavePageState createState() => _SavePageState();
}

String? linkBaslik = '';
// ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
var _LinkURL;
// ignore: prefer_typing_uninitialized_variables
var linkAciklmama;
// ignore: prefer_typing_uninitialized_variables
var linkImage;

class _SavePageState extends State<SavePage> {
  String? value;
  final items = [
    'Haber',
    'Bilim',
    'Arastirma',
    'Kitap',
    'Hobi',
    'Eglence',
    'Craft',
    'Alisveris',
    'Film/Music',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: MyCustomarColors.benthicBlack,
      child: Stack(
        children: [
          bluerposition(),
          Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/00.webp'), fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: SingleChildScrollView(
              child: Container(
                width: 360,
                height: linkImage == null || linkImage == '' ? 600 : 900,
                color: Colors.black12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    MyButton(
                      title: 'Verileri Temizle',
                      buttomIcon: const Icon(Icons.clear_all_rounded, size: 24.0, color: MyCustomarColors.midasFingerGold),
                      buttomColor: MyCustomarColors.benthicBlack,
                      onPress: () {
                        setState(() {
                          linkBaslik = '';
                          linkAciklmama = '';
                          linkImage = '';
                          _LinkURL = '';
                          linkURLController.text = '';
                        });
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: UrlBilgiContainer(),
                    ),
                    linkBaslik != ''
                        ? const SizedBox()
                        : MyButton(
                            title: 'Link`i Ara',
                            buttomIcon: const Icon(Icons.search, size: 24.0, color: MyCustomarColors.midasFingerGold),
                            buttomColor: MyCustomarColors.benthicBlack,
                            onPress: () {
                              setState(() {});
                            },
                          ),
                    linkImage == null || linkBaslik == ''
                        ? const SizedBox()
                        : UrlContainer(
                            linkBaslik: linkBaslik.toString(),
                            linkImage: linkImage,
                            linkURL: _LinkURL,
                            linkCatagory: linkcatagory.toString(),
                            linAciklama: linkAciklmama,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Positioned bluerposition() {
    return Positioned(
        top: -350,
        left: 70,
        child: Container(
          width: 700,
          height: 700,
          decoration: const BoxDecoration(
              color: MyCustomarColors.benthicBlack,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500.0),
                  bottomLeft: Radius.circular(500.0),
                  bottomRight: Radius.circular(500.0),
                  topRight: Radius.circular(500.0))),
        ));
  }

  Future<dynamic> showerMessage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: MyCustomarColors.midasFingerGold,
              title: Container(
                height: 130,
                width: 300,
                color: MyCustomarColors.zhebZhuBaiPearl,
                child: Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.assignment_turned_in,
                        color: MyCustomarColors.midasFingerGold,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Kayıt Başarı ile alındı",
                        style: TextStyle(color: MyCustomarColors.benthicBlack, fontSize: 17),
                      ),
                    ),
                    Text(
                      "Are you sure to exit app?",
                      style: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                  ],
                ),
              ),
              //content: Text("data"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: MyCustomarColors.midasFingerGold,
                                title: Container(
                                  height: 120,
                                  width: 300,
                                  color: MyCustomarColors.zhebZhuBaiPearl,
                                  child: Column(
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.assignment_turned_in,
                                          color: MyCustomarColors.midasFingerGold,
                                          size: 35,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Kayıt DETAYI",
                                          style: TextStyle(color: MyCustomarColors.benthicBlack, fontSize: 17),
                                        ),
                                      ),
                                      Text(
                                        "Are you sure to exit app?",
                                        style: TextStyle(color: Colors.black38, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                //content: Text("data"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Geri...',
                                        style: TextStyle(color: MyCustomarColors.benthicBlack, fontSize: 20),
                                      )),
                                ],
                              ));
                    },
                    child: const Text(
                      'Detay.',
                      style: TextStyle(color: MyCustomarColors.benthicBlack, fontSize: 20),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Tamam',
                      style: TextStyle(color: MyCustomarColors.benthicBlack, fontSize: 20),
                    )),
              ],
            ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(color: MyCustomarColors.midasFingerGold, fontSize: 14),
      ));
}

class UrlBilgiContainer extends StatelessWidget {
  const UrlBilgiContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 300,
          child: Text(
            'Url bilgisi',
            style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomarColors.zhebZhuBaiPearl),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          width: 330,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SaveTextField(),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: DropDownButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SaveTextField extends StatelessWidget {
  const SaveTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        style: const TextStyle(fontSize: 14, color: MyCustomarColors.zhebZhuBaiPearl),
        controller: linkURLController,
        decoration: InputDecoration(
          labelText: "Link-URL",
          labelStyle: const TextStyle(color: MyCustomarColors.zhebZhuBaiPearl),
          filled: true,
          fillColor: MyCustomarColors.benthicBlack,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomarColors.deepWater)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomarColors.deepWater)),
        ),
        onChanged: (value) async {
          _LinkURL = value;
          var data = await MetadataFetch.extract(_LinkURL);
          linkBaslik = data?.title;
          linkAciklmama = data?.description;
          linkImage = data?.image;
          linkImage == null ? 'https://picsum.photos/200' : (linkImage = data?.image);
        },
      ),
    );
  }
}
