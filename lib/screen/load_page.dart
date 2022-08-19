import 'package:flutter/material.dart';

import '../constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: MyCustomarColors.benthicBlack,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage(
              'assets/images/link.png',
            ),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/link.png',
                height: 90,
                width: 90,
                color: MyCustomarColors.midasFingerGold,
              ),
              const Text(
                'Link App',
                style: TextStyle(fontFamily: 'Header', fontSize: 50, color: MyCustomarColors.midasFingerGold),
              ),
              const Spacer(),
              const Text(
                'Caylo Tech',
                style: TextStyle(fontFamily: 'Header', fontSize: 25, color: MyCustomarColors.midasFingerGold),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
