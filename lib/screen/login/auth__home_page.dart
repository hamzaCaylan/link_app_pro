import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:link_app_pro/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/button/my_button_two.dart';
import '../page_load.dart';
import 'auth_services.dart';
import 'sing_page.dart';
import 'login_page.dart';

// ignore: unused_element
final _auth = FirebaseAuth.instance;
// ignore: unused_element
AuthService _authService = AuthService();
bool showSpinner = false;
bool _isLoading = false;

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  bool showSpinner = false;
  @override
  void initState() {
    super.initState();
    //autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('email');
    final String? userPassword = prefs.getString('password');
    if (userId != '' && userPassword != '') {
      setState(() {
        _isLoading = true;
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isLoading = false;
          });
        });
        showSpinner = true;
        email = userId;
        password = userPassword;
        RefUser = FirebaseFirestore.instance.collection('Doc-MAK.USER').doc('User').collection(email);
      });
      _authService.signIn(email, password).then((value) {
        return Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoadingPage()),
        );
      });

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: MyCustomerColors.benthicBlack,
        body: _isLoading
            ? Container(
                decoration: BoxDecoration(
                  color: MyCustomerColors.benthicBlack,
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
                        color: MyCustomerColors.midasFingerGold,
                      ),
                      const Text(
                        'Link App',
                        style: TextStyle(fontFamily: 'Header', fontSize: 50, color: MyCustomerColors.midasFingerGold),
                      ),
                      const Spacer(),
                      const Text(
                        'Caylo Tech',
                        style: TextStyle(fontFamily: 'Header', fontSize: 25, color: MyCustomerColors.midasFingerGold),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            : Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/00.webp'), fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Colors.transparent,
                      const Color(0xff161d27).withOpacity(0.9),
                      const Color(0xff161d27),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Spacer(
                          flex: 5,
                        ),
                        const Text(
                          "Hoş Geldin!",
                          style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          "...",
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        MyButtonTwo(
                          title: 'Oturum AC',
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MyButtonTwo(
                          title: 'Kayit Ol',
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SingPage()));
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
