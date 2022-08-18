import 'package:flutter/material.dart';
import 'screen/navigator.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

String images = 'https://picsum.photos/seed/picsum/450/300';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorBar(),
    );
  }
}
