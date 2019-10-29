import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lol_app/app/pages/match/match_page.dart';

class MatchModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => MatchPage();

  static Inject get to => Inject<MatchModule>.of();
}
