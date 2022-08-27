import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../widgets/button/my_button_two.dart';
import 'auth_services.dart';
import 'sing_page.dart';

// ignore: unused_element
final _auth = FirebaseAuth.instance;
// ignore: unused_element
AuthService _authService = AuthService();
bool showSpinner = false;
// ignore: unused_element
bool _isLoading = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> logout() {
    final SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    // ignore: null_check_always_fails
    prefs.setString('email', null!);
  }

  Future<void> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text.toString());
    prefs.setString('password', passwordController.text.toString());
    setState(() {
      email = emailController.text.toString();
      password = passwordController.text.toString();
      showSpinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyCustomerColors.benthicBlack,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Spacer(
                        flex: 8,
                      ),
                      const Text(
                        "Oturum Aç",
                        style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: const TextStyle(color: MyCustomerColors.deepWater),
                            filled: true,
                            fillColor: MyCustomerColors.benthicBlack,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.deepWater)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.deepWater)),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "  Parola",
                            labelStyle: const TextStyle(color: MyCustomerColors.deepWater),
                            //   errorText:  userNameValidate  ? 'Please enter a Username' : null,
                            //hintText: "  Parola",
                            // hintStyle: TextStyle(color: MyCustomerColors.midasFingerGold),
                            filled: true,
                            fillColor: MyCustomerColors.benthicBlack,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.deepWater)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.deepWater)),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 0, bottom: 0),
                          child: CheckboxListTile(
                            title: const Text(
                              'Beni hatırla',
                              style: TextStyle(color: MyCustomerColors.zhebZhuBaiPearl),
                            ),
                            tileColor: MyCustomerColors.carnelian,
                            value: timeDilation != 1.0,
                            onChanged: (bool? value) {
                              //////////////////////////
                              loginUser();
                              //////////////////////////////////////////////////////////////////////////////
                              setState(() {
                                timeDilation = value! ? 2.0 : 1.0;
                              });
                            },
                          ),
                        ),
                      ),
                      MyButtonTwo(
                        title: 'Oturum AC',
                        onPress: () {
                          if (emailController.text.length >= 10 && passwordController.text.length >= 6) {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              _authService.signIn(emailController.text, passwordController.text).then((value) {
                                /*return Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Bot_()),
                                  );*/
                              });
                              setState(() {
                                showSpinner = false;
                                RefUser = FirebaseFirestore.instance.collection('Doc-MAK.USER').doc('User').collection(emailController.text);
                              });
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => AlertDialog(
                                      backgroundColor: MyCustomerColors.midasFingerGold,
                                      title: Container(
                                        height: 130,
                                        width: 300,
                                        color: MyCustomerColors.zhebZhuBaiPearl,
                                        child: Column(
                                          children: const <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.error,
                                                color: MyCustomerColors.carnelian,
                                                size: 35,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                "Giriş talebi başarısız",
                                                style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 17),
                                              ),
                                            ),
                                            Text(
                                              "Üyelik bilgilerini kontrol ediniz",
                                              style: TextStyle(color: Colors.black38, fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //content: Text("data"),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Tekrar Dene',
                                              style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 20),
                                            )),
                                      ],
                                    ));
                          }
                        },
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
    );
  }
}
