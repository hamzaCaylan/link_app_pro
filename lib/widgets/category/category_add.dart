import 'dart:convert';
import 'package:flutter/material.dart';
import '../showmessage/show_message.dart';
import 'category_constants.dart';
import 'package:http/http.dart' as http;

String jsondata =
    'https://firebasestorage.googleapis.com/v0/b/linkapp-17.appspot.com/o/category.json?alt=media&token=5835139a-0655-4248-9b8d-acf74fd29ae3';

class CategoryAdd extends StatelessWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  final String add = 'Kategori Ekle';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CategoryPadding.paddingAllEight,
      child: Container(
        decoration: categoryDecoration(),
        width: MediaQuery.of(context).size.width * 0.35, //double.infinity,
        child: InkWell(
          child: Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/add.png',
                  color: CategoryColors.midasFingerGold,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: CategoryColors.opicswallowBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: CategorySize.categoryHeight,
                  width: MediaQuery.of(context).size.width * 0.37, //double.infinity,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        add,
                        style: categorytextstyle(),
                      )),
                ),
              ),
            ],
          ),
          onTap: () async {
            addMessage(context);
          },
        ),
      ),
    );
  }

  Future<dynamic> addMessage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => MyAlertWidget(
        title: 'Yeni kategory eklendi',
        undertitle: '.....Adli yeni kategori eklendi BOSSSS ',
        luttie: 'assets/lotties/ok.json',
        repeat: false,
        onPress: () {
          Navigator.pop(context);
        },
        onPressTwoSee: false,
        onPressTwo: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  BoxDecoration categoryDecoration() {
    return BoxDecoration(
      color: CategoryColors.transparent,
      image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(CategoryColors.opicswallowBlue.withOpacity(0.5), BlendMode.dstATop),
        image: CategoryImage.link,
      ),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  TextStyle categorytextstyle() {
    return const TextStyle(
      fontFamily: 'Besiktas',
      color: CategoryColors.zhebZhuBaiPearl,
      fontSize: CategorySize.titleSmall,
    );
  }
}

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  Future getCategoryData() async {
    var response = await http.get(Uri.https(jsondata));
    var jsonData = jsonDecode(response.body);
    List<Categoryler> categorys = [];

    for (var u in jsonData) {
      Categoryler category = Categoryler(u['names'], u['icon']);
      categorys.add(category);
    }
    return categorys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: FutureBuilder(
            future: getCategoryData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text('data');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data.name),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

class Categoryler {
  final String name, icon;
  Categoryler(this.name, this.icon);
}
