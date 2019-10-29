import 'package:flutter/material.dart';
import 'package:lol_app/app/pages/match/match_builder_reduced.dart';

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Center(
                child: Text(
                  "Partidas",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: "RobotoSlab",
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 99,
                itemBuilder: (BuildContext context, int index){
                  return Item().getMatch(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

