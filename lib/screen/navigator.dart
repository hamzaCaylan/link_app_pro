import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/add_group_category/group_add/group_add_page.dart';
import 'homepage.dart';
import 'profile.dart';
import 'save_page.dart';

var _selectedIndex = 0;
var padding = 8.0;

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _NavigatorBarState createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int pence = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: MyCustomerColors.benthicBlack,
        body: Row(
          children: [
            NavigationRail(
              backgroundColor: MyCustomerColors.benthicBlack,
              minWidth: MediaQuery.of(context).size.width * 0.11,
              groupAlignment: 0.75,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(
                  () {
                    _selectedIndex = index;
                    indext = index;
                    pence = index;
                  },
                );
              },
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: selecttextstyle(),
              unselectedLabelTextStyle: unselecttextstyle(),
              destinations: [
                const NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: Icon(Icons.workspaces, color: Colors.amber),
                ),
                buildRotatedTextRailDestinations('Linkler', padding, const SizedBox.shrink()),
                buildRotatedTextRailDestinations("Link Kayit", padding, const SizedBox.shrink()),
                buildRotatedTextRailDestinations("Grup kayit", padding, const SizedBox.shrink()),
                buildRotatedTextRailDestinations("Profil", padding, const SizedBox.shrink()),
              ],
            ),
            Expanded(child: buildPages()),
          ],
        ),
      ),
    );
  }

  TextStyle unselecttextstyle() {
    return const TextStyle(
      color: MyCustomerColors.deepWater,
      fontWeight: FontWeight.bold,
      fontFamily: 'Player',
      fontSize: 11.0,
      decorationThickness: 2.0,
    );
  }

  TextStyle selecttextstyle() {
    return const TextStyle(
      color: MyCustomerColors.midasFingerGold,
      fontWeight: FontWeight.bold,
      fontFamily: 'Player',
      fontSize: 12.0,
      decorationThickness: 2.0,
    );
  }

  NavigationRailDestination buildRotatedTextRailDestinations(String text, double padding, Widget icon) {
    return NavigationRailDestination(
      icon: icon,
      label: RotatedBox(
          quarterTurns: -1,
          child: Stack(
            children: [
              Text(text),
            ],
          )),
    );
  }

  var indext = 0;
  // ignore: missing_return
  buildPages() {
    switch (indext) {
      case 0:
        return const MyPages(body: MyHomePage());
      case 1:
        return const MyPages(
          body: MyHomePage(),
        ); //MyHomePage();
      case 2:
        return const MyPages(body: SavePage()); //SavePage();
      case 3:
        return const MyPages(body: GroupAddPage());
      case 4:
        return const MyPages(body: Profile());
      //Profil();
    }
  }
}

class MyPages extends StatelessWidget {
  const MyPages({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyCustomerColors.benthicBlack,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/00.webp'), fit: BoxFit.cover)),
            ),
            const Positioned(top: -350, left: 70, child: SizedBox()),
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 1, sigmaY: 4), child: body),
          ],
        ),
      ),
    );
  }
}
