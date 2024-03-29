import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart';

String apiKey = "RGAPI-6ce639a0-beac-46ed-8ca8-d17b0d895e82";

class SummonerIDRepository extends Disposable {

  Client client = Client();

  Future<Map<dynamic, dynamic>> getSummonerID(String summonerName) async {
    
    final response = await client.get("https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName?api_key=$apiKey");
    if(response.statusCode == 200) {
      var list = json.decode(response.body) as Map<dynamic, dynamic>;
      return list;
    }else
      throw Exception('Error');
  }

  @override
  void dispose() {}
}
