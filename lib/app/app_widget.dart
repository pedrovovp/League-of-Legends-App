import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lol_app/app/pages/home/home_module.dart';
import 'package:lol_app/app/pages/summoner_info/summoner_info_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeModule(),
      routes: {
        '/home': (BuildContext context) => HomeModule(),
        '/summoner': (BuildContext context) => SummonerInfoModule(),
      },
    );
  }
}
