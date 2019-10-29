import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart';

class ChampionNameRepository extends Disposable {
  
  Client client = Client();

  Future getChampionName() async{
    final response = await client.get("http://ddragon.leagueoflegends.com/cdn/9.21.1/data/en_US/champion.json");

    if(response.statusCode == 200)
    {
      var list = json.decode(response.body);
      return list;
    }else
      throw Exception('Error');
  }

  @override
  void dispose() {}
}
