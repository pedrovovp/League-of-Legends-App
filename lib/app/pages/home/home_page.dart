import 'package:flutter/material.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';
import '../../repositories/summonerID_repository.dart';

TextEditingController summonerNameCtrl = TextEditingController();
SummonerIDRepository _summonerIDRepository = SummonerIDRepository();
SummonerInfoRepository _summonerInfoRepository = SummonerInfoRepository();
String id;
var resultInfo, resultID;

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
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/assets/images/bg-2.png'),
          fit: BoxFit.cover,
        )),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Know Your Legend",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
            ),
          ),
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
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoSlab',
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
                  filled: true,
                  fillColor: Colors.white54,
                  hintText: "Nome de Invocador",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Procurar",style: TextStyle(
                  fontFamily: 'RobotoSlab',
              ),),
              color: Colors.white54,
              onPressed: () async {
                resultID = await _summonerIDRepository
                    .getSummonerID(summonerNameCtrl.text);
                id = resultID["id"];
                resultInfo = await _summonerInfoRepository.getSummonerInfo(id);
                Navigator.pushNamed(context, '/summoner');
              },
            )
          ],
        ),
      ),
    ]);
  }
}
