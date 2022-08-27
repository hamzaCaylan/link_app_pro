import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/category/category_list.dart';
import '../widgets/link_listview/link_list_home.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 900,
      color: Colors.black12,
      child: Column(
        children: [
          const Spacer(
            flex: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: const BoxDecoration(
                  color: MyCustomerColors.midasFingerGold,
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
                        style: TextStyle(fontFamily: 'Header', fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const CategoryList(),
          const Spacer(
            flex: 1,
          ),
          const LinkListHome(),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
