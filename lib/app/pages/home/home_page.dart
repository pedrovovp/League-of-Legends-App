import 'package:flutter/material.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';
import '../../repositories/summonerID_repository.dart';

TextEditingController summonerNameCtrl = TextEditingController();
SummonerIDRepository _summonerIDRepository = SummonerIDRepository();
SummonerInfoRepository _summonerInfoRepository = SummonerInfoRepository();
String id;
var resultInfo;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Know Your Legend"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Title(
              child: Text(
                "Digite o nome de invocador :",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: summonerNameCtrl,
              decoration: InputDecoration(
                hintText: "Nome de Invocador",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          RaisedButton(
            child: Text("Procurar"),
            onPressed: () async {
              var resultID = await _summonerIDRepository.getSummonerID(summonerNameCtrl.text);
              id = resultID["id"];
              print(id);
              resultInfo = await _summonerInfoRepository.getSummonerInfo(id);
              Navigator.pushReplacementNamed(context, '/summoner');
            },
          )
        ],
      ),
    );
  }
}
