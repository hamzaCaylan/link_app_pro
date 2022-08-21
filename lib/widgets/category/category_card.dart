import 'package:flutter/material.dart';
import 'category_data.dart';
import 'category_constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categorysdata}) : super(key: key);
  final CategorysData categorysdata;

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
              _CategoryImage(categorysdata: categorysdata),
              const Spacer(),
              _CategoryName(categorysdata: categorysdata),
            ],
          ),
          onTap: () async {},
        ),
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
}

class _CategoryName extends StatelessWidget {
  const _CategoryName({
    required this.categorysdata,
  });

  final CategorysData categorysdata;

  @override
  Widget build(BuildContext context) {
    return Align(
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
              categorysdata.names,
              style: categorytextstyle(),
            )),
      ),
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

class _CategoryImage extends StatelessWidget {
  const _CategoryImage({required this.categorysdata});

  final CategorysData categorysdata;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        categorysdata.image,
        color: CategoryColors.midasFingerGold,
      ),
    );
  }
}
