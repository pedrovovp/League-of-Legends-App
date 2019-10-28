import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart';

String apiKey = "RGAPI-6ce639a0-beac-46ed-8ca8-d17b0d895e82";

class MatchesRepository extends Disposable {

  Client client = Client();

  Future getMatches(String accountID) async{
    final response = await client.get("https://br1.api.riotgames.com/lol/match/v4/matchlists/by-account/${accountID}?api_key=${apiKey}");

    if(response.statusCode == 200)
    {
      var list= json.decode(response.body);
      return list;
    }else
      throw Exception('Error');
  }

  @override
  void dispose() {}
}
