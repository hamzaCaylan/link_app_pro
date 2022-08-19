import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/category/category_list.dart';
import '../widgets/linkcard/linkcard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

void doNothing(BuildContext context) {}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyCustomarColors.benthicBlack,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/00.webp'),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: 360,
              height: 900,
              color: Colors.black12,
              child: Column(
                children: [
                  const Spacer(
                    flex: 6,
                  ),
                  Container(
                    width: 320,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: MyCustomarColors.midasFingerGold,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 4,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              // color: green_light2,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(50.0),
                                  bottomRight: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0))),
                          child: Image.asset(
                            'assets/images/link.png',
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 70,
                          color: Colors.transparent,
                          child: const Center(
                            child: Text(
                              'Link App.',
                              style: TextStyle(
                                  fontFamily: 'Header',
                                  fontSize: 35,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 8,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const CategoryList(),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Linklerim',
                        style: TextStyle(
                            fontFamily: 'sHeader',
                            fontSize: 16,
                            color: MyCustomarColors.zhebZhuBaiPearl),
                      ),
                      /*SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const Linkcard(
                              image: 'https://picsum.photos/450/300',
                              title: 'baslik',
                              url: 'https://picsum.photos/450/300',
                            );
                          },
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: Colors.black12,
                          height: 350,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: const [
                              Linkcard(
                                image: 'https://picsum.photos/450/300',
                                title: 'deneme',
                                url: 'https://picsum.photos/450/300',
                              ),
                              Linkcard(
                                image: 'https://picsum.photos/450/200',
                                title: 'bakas',
                                url: 'https://picsum.photos/450/200',
                              ),
                              Linkcard(
                                image: 'https://picsum.photos/440/300',
                                title: 'kartal',
                                url: 'https://picsum.photos/450/300',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
