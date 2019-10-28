import 'package:flutter/material.dart';

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
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
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(),
    );
  }
}