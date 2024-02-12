//import 'package:fluttter/TarifPage.dart';
import 'package:yemekler/yemeklerPage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YemeklerPage(),
    );
  }
}
