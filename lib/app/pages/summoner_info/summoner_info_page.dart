import 'package:flutter/material.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';
import 'package:lol_app/app/pages/home/home_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

SummonerInfoRepository _summonerInfoRepository = SummonerInfoRepository();
Map<dynamic, dynamic> infoSolo = resultInfo[1];
Map<dynamic, dynamic> infoTFT = resultInfo[2];
Map<dynamic, dynamic> infoFlex = resultInfo[0];
final pageController = PageController(initialPage: 1);

class SummonerInfoPage extends StatefulWidget {
  @override
  _SummonerInfoPageState createState() => _SummonerInfoPageState();
}

class _SummonerInfoPageState extends State<SummonerInfoPage> {
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
          image: AssetImage('lib/assets/images/bg.png'),
          fit: BoxFit.cover,
        )),
      ),
      Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Perfil de Invocador"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                infoSolo['summonerName'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            CarouselSlider(
              height: 400.0,
              items: [Solo(), TFT(), Flex()].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: i,
                        );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    ]);
  }
}

class Solo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "SOLO/DUO",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/${infoSolo['tier']}.png',
            ),
            height: 250,
            width: 250,
          ),
          Text(
            "${infoSolo['tier']} ${infoSolo['rank']}",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Vítorias : ${infoSolo['wins']}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                "PDL : ${infoSolo['leaguePoints']}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TFT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "TFT",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/${infoTFT['tier']}.png',
            ),
            height: 250,
            width: 250,
          ),
          Text(
            "${infoTFT['tier']} ${infoTFT['rank']}",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Vítorias : ${infoTFT['wins']}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                "PDL : ${infoTFT['leaguePoints']}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Flex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Flex",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/${infoFlex['tier']}.png',
            ),
            height: 250,
            width: 250,
          ),
          Text(
            "${infoFlex['tier']} ${infoFlex['rank']}",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Vítorias : ${infoFlex['wins']}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                "PDL : ${infoFlex['leaguePoints']}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}