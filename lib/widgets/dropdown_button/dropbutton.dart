import 'package:flutter/material.dart';
import 'drboxconstants.dart';

String? linkcatagory = '';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? value;
  final items = [
    'Haber',
    'Bilim',
    'Kamp',
    'Arastirma',
    'Kitap',
    'Hobi',
    'Eglence',
    'Craft',
    'Alisveris',
    'Film/Music',
    'Proje 1',
    'Proje 2',
    'Proje 4',
    'Proje 5',
  ];
  String title = 'Grup Adi';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* dropDownStyle(
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Link').doc(emaill).collection('Grup').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('data yok'),
                );
              }
              return Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: DropdownButton(
                      dropdownColor: DropDownButtonColors.black87,
                      hint: Text(
                        title,
                        style: const TextStyle(color: DropDownButtonColors.midasFingerGold, fontSize: 14),
                      ),
                      iconSize: 36,
                      icon: const DropButtonIcon(),
                      isExpanded: true,
                      value: _category,
                      isDense: true,
                      onChanged: (newValue) {
                        setState(() {
                          _category = newValue!;
                          title = _category;
                        });
                      },
                      items: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document['Group title'],
                            child: Text(
                              document['Group title'],
                              style: const TextStyle(color: DropDownButtonColors.midasFingerGold, fontSize: 14),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),*/
        const SizedBox(
          height: 5,
        ),
        dropDownStyle(
          DropdownButton<String>(
            value: value,
            dropdownColor: DropDownButtonColors.black87,
            hint: Text(
              'Link Katagori',
              style: dropbuttontextstyle(),
            ),
            iconSize: 36,
            icon: const DropButtonIcon(),
            isExpanded: true,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) => setState(() {
              this.value = value;
              linkcatagory = value;
            }),
          ),
        ),
      ],
    );
  }

  Padding dropDownStyle(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: DropDownButtonColors.deepWater,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: dropbuttondecor(),
            width: 330,
            height: 50,
            child: Padding(
              padding: dropbuttonpadding(),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets dropbuttonpadding() => const EdgeInsets.only(left: 10, right: 10);

  TextStyle dropbuttontextstyle() {
    return const TextStyle(color: DropDownButtonColors.zhebZhuBaiPearl, fontSize: 14);
  }

  BoxDecoration dropbuttondecor() {
    return const BoxDecoration(
      color: DropDownButtonColors.benthicBlack,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(color: DropDownButtonColors.midasFingerGold, fontSize: 14),
        ),
      );
}

class DropButtonIcon extends StatelessWidget {
  const DropButtonIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.keyboard_arrow_down, color: DropDownButtonColors.midasFingerGold);
  }
}
