import 'package:flutter/material.dart';
import 'package:link_app_pro/widgets/add_group_category/group_add/test.dart';
import '../add_group_category/category_add/category_add.dart';
import '../add_group_category/category_add/category_add_page.dart';
import '../add_group_category/group_add/group_list.dart';
import 'category_card.dart';
import 'category_constants.dart';
import 'category_data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Katagoriler',
              style: TextStyle(fontFamily: 'sHeader', fontSize: 16, color: CategoryColors.zhebZhuBaiPearl),
            ),
          ),
          SizedBox(
            height: 210,
            width: 330,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SizedBox(
                height: 210,
                width: 330,
                child: Container(
                  decoration: aliowskyBoxdecoration(),
                  width: 330,
                  height: 210,
                  child: const CategoryScrollview(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration aliowskyBoxdecoration() {
    return const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)));
  }
}

class CategoryScrollview extends StatelessWidget {
  const CategoryScrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(
            title: 'Ekle',
            icon: 'add.png',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoryAddPage(),
                ),
              );
            },
          ),
          CategoryButton(
            title: 'Gruplar',
            icon: 'folder.png',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GroupList(),
                ),
              );
            },
          ),
          for (int i = 0; i < categorysdata.length; i++) CategoryCard(categorysdata: categorysdata[i]),
        ],
      ),
    );
  }
}
