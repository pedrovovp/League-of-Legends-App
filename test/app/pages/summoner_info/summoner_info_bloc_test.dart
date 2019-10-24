import 'package:flutter_test/flutter_test.dart';

import 'package:lol_app/app/pages/summoner_info/summoner_info_bloc.dart';

void main() {
  SummonerInfoBloc bloc;

  setUp(() {
    bloc = SummonerInfoBloc();
  });

  group('SummonerInfoBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<SummonerInfoBloc>());
    });
  });
}
