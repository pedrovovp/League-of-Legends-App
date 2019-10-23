import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart';
import 'package:lol_app/app/models/summonerID_json.dart';

String apiKey = "RGAPI-d0b0ec7c-a7e5-4966-bf63-208aa5177d6e";

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
