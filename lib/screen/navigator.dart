import 'package:flutter/material.dart';
import '../constants.dart';
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
    return Scaffold(
      backgroundColor: MyCustomerColors.benthicBlack,
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: MyCustomerColors.benthicBlack,
            minWidth: MediaQuery.of(context).size.width * 0.116,
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
              buildRotatedTextRailDestinations('Linkler', padding),
              buildRotatedTextRailDestinations("Link Kayit", padding),
              buildRotatedTextRailDestinations("Profil", padding),
            ],
          ),
          Expanded(child: buildPages()),
        ],
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

  NavigationRailDestination buildRotatedTextRailDestinations(String text, double padding) {
    return NavigationRailDestination(
      icon: const SizedBox.shrink(),
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
        return const MyHomePage(); //MyHomePage();
      case 1:
        return const SavePage(); //SavePage();
      case 2:
        return const Profile(); //Profil();
    }
  }
}
