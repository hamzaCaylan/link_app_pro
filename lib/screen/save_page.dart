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
String? linkAciklmama = '';
// ignore: prefer_typing_uninitialized_variables
String? linkImage = '';

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: linkImage == null || linkImage == '' ? 750 : 900,
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
              buttonIcon: const Icon(Icons.clear_all_rounded, size: 24.0, color: MyCustomerColors.midasFingerGold),
              buttonColor: MyCustomerColors.benthicBlack,
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
                    buttonIcon: const Icon(Icons.search, size: 24.0, color: MyCustomerColors.midasFingerGold),
                    buttonColor: MyCustomerColors.benthicBlack,
                    onPress: () {
                      setState(() {});
                    },
                  ),
            linkBaslik == ''
                ? const SizedBox()
                : UrlContainer(
                    linkBaslik: linkBaslik.toString(),
                    linkImage: linkImage.toString(),
                    linkURL: _LinkURL.toString(),
                    linkCatagory: linkcatagory.toString(),
                    linAciklama: linkAciklmama.toString(),
                  ),
          ],
        ),
      ),
    );
  }
}

class UrlBilgiContainer extends StatelessWidget {
  const UrlBilgiContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text(
              'Url bilgisi',
              style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: MyCustomerColors.zhebZhuBaiPearl),
            ),
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
          width: MediaQuery.of(context).size.width,
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
        style: const TextStyle(fontSize: 14, color: MyCustomerColors.zhebZhuBaiPearl),
        controller: linkURLController,
        decoration: InputDecoration(
          labelText: "Link-URL",
          labelStyle: const TextStyle(color: MyCustomerColors.zhebZhuBaiPearl),
          filled: true,
          fillColor: MyCustomerColors.benthicBlack,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.deepWater)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.deepWater)),
        ),
        onChanged: (value) async {
          _LinkURL = value;
          var data = await MetadataFetch.extract(_LinkURL!);
          data?.title == null ? 'Veri Yok' : linkBaslik = data?.title;
          data?.description == null ? linkAciklmama = 'Veri Yok' : linkAciklmama = data?.description;
          data?.image == null ? linkImage = 'Veri Yok' : linkImage = data?.image;
        },
      ),
    );
  }
}
