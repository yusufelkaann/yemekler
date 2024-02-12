//root listview
//her bir yemek için row
//her rowda ilk image
//yanında yemeğin ismi 
//yemeğin altında dahan soluk renkte tahmini süre
//en sonda button
// when on pressed modal bottom sheet çıkıyor
// bottom shette 
//büyük yemek resmi 
//yemek ismi
// altında tahmini süre
// altta tarif

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:yemekler/TarifPage.dart';

//import 'package:flutter/TarifPage.dart';


class YemeklerPage extends StatefulWidget {
  const YemeklerPage({Key? key}) : super(key: key);

  @override
  State<YemeklerPage> createState() => _YemeklerPageState();
}

class _YemeklerPageState extends State<YemeklerPage> {
  String yemek = "Karnıyarık";
  String tahminiSure = '45 dakika';
  String yemerkUrl =
      'https://cdn.yemek.com/mnresize/940/940/uploads/2022/08/100-gram-kiymayla-karniyarik-one-cikan.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekler'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          YemekRow(yemek: yemek, yemekUrl: yemerkUrl, tahminiSure: tahminiSure, yemekGoster: () => yemekGoster(yemek, yemerkUrl),),
        ],
      ),
    );
  }
  void yemekGoster(String yemek, String yemekUrl) {
  showModalBottomSheet(
    context: context,
    builder: (context) => ListView(
      children: [
        Image.network(
          yemekUrl,
          width: 232,
          height: 227,
        ),
        Text(yemek),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TarifPage()),
            );
          },
          child: Text('Tarife Git!66'),
          ),
        ],
      ),
    );
  }
}

class YemekRow extends StatelessWidget {
  final String yemek;
  final String yemekUrl;
  final String tahminiSure;
  final void Function() yemekGoster;

  const YemekRow({
    Key? key,
    required this.yemek,
    required this.yemekUrl,
    required this.tahminiSure,
    required this.yemekGoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          yemekUrl,
          width: 77,
          height: 77,
        ),
        ListTile(
          title: Text(yemek),
          titleTextStyle: TextStyle(color: Colors.black),
          subtitle: Text("Tahmini süre $tahminiSure"),
          subtitleTextStyle: TextStyle(color: Color.fromARGB(255, 37, 35, 35)),
        ),
        IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: yemekGoster,
        ),
      ],
    );
  }
}

