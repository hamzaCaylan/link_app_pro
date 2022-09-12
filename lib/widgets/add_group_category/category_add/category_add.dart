import 'package:flutter/material.dart';
import '../../showmessage/show_message.dart';
import '../../category/category_constants.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key, required this.title, required this.icon, required this.onPress}) : super(key: key);
  final String title;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CategoryPadding.paddingAllEight,
      child: Container(
        decoration: categoryDecoration(),
        width: MediaQuery.of(context).size.width * 0.35, //double.infinity,
        child: InkWell(
          onTap: onPress,
          child: Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/$icon',
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
                        title,
                        style: categorytextstyle(),
                      )),
                ),
              ),
            ],
          ),
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
