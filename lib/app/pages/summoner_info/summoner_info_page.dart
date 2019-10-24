import 'package:flutter/material.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';
import 'package:lol_app/app/pages/home/home_page.dart';

SummonerInfoRepository _summonerInfoRepository = SummonerInfoRepository();
Map<dynamic,dynamic> info1 = resultInfo[0];
Map<dynamic,dynamic> info2 = resultInfo[1];
Map<dynamic,dynamic> info3 = resultInfo[2];

class SummonerInfoPage extends StatefulWidget {
  @override
  _SummonerInfoPageState createState() => _SummonerInfoPageState();
}

class _SummonerInfoPageState extends State<SummonerInfoPage> {
 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("SummonerInfo"),
      ),
      body: Column(
        children: <Widget>[
          Text(info1['summonerName']),
        ],
      ),
    );
  }
}
