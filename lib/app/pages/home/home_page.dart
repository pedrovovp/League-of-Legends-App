import 'package:flutter/material.dart';
import '../../repositories/summonerID_repository.dart';

TextEditingController summonerNameCtrl = TextEditingController();
SummonerIDRepository summonerRepository = SummonerIDRepository();
Future<String> id;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            onPressed: () {
              summonerRepository.getSummonerID(summonerNameCtrl.text);
              print(id);
            },
          )
        ],
      ),
    );
  }
}
