import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart';

String apiKey = "RGAPI-d0b0ec7c-a7e5-4966-bf63-208aa5177d6e";

class SummonerInfoRepository extends Disposable {

  Client client = Client();

  Future getSummonerInfo(String id) async {
    final response = await client.get('https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/$id?api_key=$apiKey');
  
    if(response.statusCode == 200)
    {
      var list = json.decode(response.body) as List<dynamic>;
      return list;
    }else
      throw Exception('Error');
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
