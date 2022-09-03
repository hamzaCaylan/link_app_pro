import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screen/navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

String images = 'https://picsum.photos/seed/picsum/450/300';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorBar(), //Deneme(), //LoginHomePage(), //
    );
  }
}
