import 'package:lol_app/app/repositories/champion_name_repository.dart';
import 'package:lol_app/app/pages/match/match_bloc.dart';
import 'package:lol_app/app/repositories/matches_repository.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';
import 'package:lol_app/app/pages/summoner_info/summoner_info_bloc.dart';
import 'package:lol_app/app/repositories/summonerID_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lol_app/app/app_widget.dart';
import 'package:lol_app/app/app_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => MatchBloc()),
        Bloc((i) => SummonerInfoBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => ChampionNameRepository()),
        Dependency((i) => MatchesRepository()),
        Dependency((i) => SummonerInfoRepository()),
        Dependency((i) => SummonerIDRepository()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
