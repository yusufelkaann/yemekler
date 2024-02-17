// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
//rimport 'package:flutter/yemeklerPage.dart';




class TarifPage extends StatelessWidget {
  final String dishName;
  final String imageUrl;

  const TarifPage({Key? key, required this.dishName, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif: $dishName'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              dishName,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Tarif', 
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
