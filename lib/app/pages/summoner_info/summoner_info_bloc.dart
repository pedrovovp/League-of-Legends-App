import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class SummonerInfoBloc extends BlocBase {

  final _summonerInfoController = BehaviorSubject<int>();
  Sink<int> get summonerInput => _summonerInfoController.sink;
  Stream<int> get summonerOutput => _summonerInfoController.stream;

  @override
  void dispose() {
    super.dispose();
  }
}
