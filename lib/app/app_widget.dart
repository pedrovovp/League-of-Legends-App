import 'package:flutter/material.dart';
import 'package:lol_app/app/pages/home/home_module.dart';
import 'package:lol_app/app/pages/home/home_page.dart';
import 'package:lol_app/app/pages/summoner_info/summoner_info_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeModule(),
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/summoner': (BuildContext context) => SummonerInfoPage(),
      },
    );
  }
}
