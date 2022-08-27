import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/button/my_button_two.dart';
import 'auth_services.dart';
import 'login_page.dart';

// ignore: unused_element
final _auth = FirebaseAuth.instance;
// ignore: unused_element
AuthService _authService = AuthService();
bool showSpinner = false;
// ignore: unused_element
bool _isLoading = false;

class SingPage extends StatelessWidget {
  const SingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  "Yeni Kayıt Aç",
                  style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  "",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                const SizedBox(
                  height: 19,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(color: MyCustomerColors.benthicBlack),
                      filled: true,
                      fillColor: MyCustomerColors.benthicBlack,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.benthicBlack)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.benthicBlack)),
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
                      labelStyle: const TextStyle(color: MyCustomerColors.benthicBlack),
                      //   errorText:  userNameValidate  ? 'Please enter a Username' : null,
                      //hintText: "  Parola",
                      // hintStyle: TextStyle(color: MyCustomerColors.midasFingerGold),
                      filled: true,
                      fillColor: MyCustomerColors.benthicBlack,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.benthicBlack)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: MyCustomerColors.benthicBlack)),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  "errgdf",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: MyCustomerColors.benthicBlack,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(60.0),
                              bottomRight: Radius.circular(15.0),
                              topRight: Radius.circular(60.0))),
                      height: 60,
                      width: 320,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'OTURUM AC',
                          style: TextStyle(fontSize: 15, color: MyCustomerColors.zhebZhuBaiPearl),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButtonTwo(
                  title: 'Kayit Ol',
                  onPress: () {
                    if (emailController.text.length >= 10 && passwordController.text.length >= 6) {
                      try {
                        final newUser = FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                        // ignore: unnecessary_null_comparison
                        if (newUser != null) {
                          Map<String, dynamic> demoData = {
                            "Kullanıcı Email": "$email",
                          };
                          CollectionReference collectionReference =
                              FirebaseFirestore.instance.collection('Doc-MAK.USER').doc("User").collection('$email');
                          collectionReference.add(demoData);
                        }
                      } catch (e) {
                        print(e);
                      }
                      print(" K A Y I T 2");
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
                                          Icons.assignment_turned_in,
                                          color: MyCustomerColors.deepWater,
                                          size: 35,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Kayıt talebi başarı ile alındı",
                                          style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 17),
                                        ),
                                      ),
                                      Text(
                                        "Lütfen E-mail adresinizi onaylayın",
                                        style: TextStyle(color: Colors.black38, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                //content: Text("data"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) => AlertDialog(
                                                  backgroundColor: MyCustomerColors.midasFingerGold,
                                                  title: Container(
                                                    height: 120,
                                                    width: 300,
                                                    color: MyCustomerColors.zhebZhuBaiPearl,
                                                    child: Column(
                                                      children: const <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Icon(
                                                            Icons.assignment_turned_in,
                                                            color: MyCustomerColors.deepWater,
                                                            size: 35,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.all(4.0),
                                                          child: Text(
                                                            "Kayıt DETAYI",
                                                            style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 17),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Are you sure to exit app?",
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
                                                          'Geri...',
                                                          style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 20),
                                                        )),
                                                  ],
                                                ));
                                      },
                                      child: const Text(
                                        'Detay.',
                                        style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 20),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Tamam',
                                        style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 20),
                                      )),
                                ],
                              ));
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
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.close,
                                          color: MyCustomerColors.benthicBlack,
                                          size: 35,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Kayıt talebi başarısız",
                                          style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 17),
                                        ),
                                      ),
                                      Text(
                                        "Lütfen bütün bilgileri girdiğinizden emin olun.",
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
                                      child: Text(
                                        'Tekrar Dene',
                                        style: TextStyle(color: MyCustomerColors.benthicBlack, fontSize: 20),
                                      )),
                                ],
                              ));
                    }
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
