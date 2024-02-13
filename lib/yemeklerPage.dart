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
  String yemekKarniyarik = "Karnıyarık";
  String tahminiSureKarniyarik = '45 dakika';
  String yemerkUrlKarniyarik =
      'https://cdn.yemek.com/mnresize/940/940/uploads/2022/08/100-gram-kiymayla-karniyarik-one-cikan.jpg';
  String yemekManti = "Mantı";
  String tahminiSureManti = '40 dakika';
  String yemekUrlManti = 'https://cdn.yemek.com/mnresize/1250/833/uploads/2017/02/kayseri-mantisi-onecikan-yeni.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemekler'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          YemekRow(yemek: yemekKarniyarik, yemekUrl: yemerkUrlKarniyarik, tahminiSure: tahminiSureKarniyarik, yemekGoster: () => yemekGoster(yemekKarniyarik, yemerkUrlKarniyarik),),
          YemekRow(yemek: yemekManti, yemekUrl: yemekUrlManti, tahminiSure: tahminiSureManti, yemekGoster: () => yemekGoster(yemekManti, yemekUrlManti),),
        ],
      ),
    );
  }
  void yemekGoster(String yemek, String yemekUrl) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          
          Image.network(
            yemekUrl,
            width: 150,
            height: 150,
             
          ),
          
          Center(
            child: Text(
              yemek,
              style: TextStyle(fontSize: 24),
            )
          ),
          
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TarifPage(dishName: yemek, imageUrl: yemekUrl,)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, 
              foregroundColor: Colors.black,
            ),
            child: Text('Tarife Git!'),
              
              
          ),
          
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              yemekUrl,
              width: 77,
              height: 77,
            ),
            SizedBox(
              width: 30,
              child: ListTile(
                title: Text(yemek),
                titleTextStyle: TextStyle(color: Colors.black),
                subtitle: Text(" $tahminiSure"),
                subtitleTextStyle: TextStyle(color: Color.fromARGB(255, 37, 35, 35)),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: yemekGoster,
            ),
          ],
        ),
      ),
    );
  }
}

