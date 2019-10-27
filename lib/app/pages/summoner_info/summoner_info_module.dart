import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lol_app/app/pages/summoner_info/summoner_info_page.dart';

class SummonerInfoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SummonerInfoPage();

  static Inject get to => Inject<SummonerInfoModule>.of();
}
