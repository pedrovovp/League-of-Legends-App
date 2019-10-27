import 'package:flutter/material.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';
import 'package:lol_app/app/pages/home/home_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

SummonerInfoRepository _summonerInfoRepository = SummonerInfoRepository();
Map<dynamic, dynamic> infoSolo;
Map<dynamic, dynamic> infoTFT;
Map<dynamic, dynamic> infoFlex;

final pageController = PageController(initialPage: 1);

class SummonerInfoPage extends StatefulWidget {
  @override
  _SummonerInfoPageState createState() => _SummonerInfoPageState();
}

class _SummonerInfoPageState extends State<SummonerInfoPage> {
  @override
  void initState() {
    for (int i = 0; i < resultInfo.length; i++) {
      if (resultInfo[i] != null &&
          resultInfo[i]['queueType'] == 'RANKED_SOLO_5x5')
        infoSolo = resultInfo[i];
    }
    for (int i = 0; i < resultInfo.length; i++) {
      if (resultInfo[i] != null &&
          resultInfo[i]['queueType'] == 'RANKED_FLEX_SR')
        infoFlex = resultInfo[i];
    }
    for (int i = 0; i < resultInfo.length; i++) {
      if (resultInfo[i] != null && resultInfo[i]['queueType'] == 'RANKED_TFT')
        infoTFT = resultInfo[i];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/bg-2.png'),
                fit: BoxFit.cover)),
      ),
      Scaffold(
        backgroundColor: Colors.white10,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black38,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.first_page,
                  color: Colors.white,
                ),
                onPressed: () {
                  infoFlex.clear();
                  infoSolo.clear();
                  infoTFT.clear();
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.white,
                ),
                onPressed: () => Profile(),
              ),
              IconButton(
                icon: Icon(
                  Icons.games,
                  color: Colors.white,
                ),
                onPressed: null,
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  resultID['name'],
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              CarouselSlider(
                height: 400.0,
                items: [Profile(), Solo(), TFT(), Flex()].map((i) {
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
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class Solo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (infoSolo.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Solo",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/UNRANKED.png',
            ),
            height: 280,
            width: 280,
          ),
          Text(
            "UNRANKED",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ],
      );
    } else
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "SOLO/DUO",
              style: TextStyle(
                fontFamily: 'RobotoSlab',
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
                fontFamily: 'RobotoSlab',
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
                    fontFamily: 'RobotoSlab',
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "PDL : ${infoSolo['leaguePoints']}",
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
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
    if (infoTFT.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "TFT",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/UNRANKED.png',
            ),
            height: 300,
            width: 300,
          ),
          Text(
            "UNRANKED",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ],
      );
    } else
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "TFT",
              style: TextStyle(
                fontFamily: 'RobotoSlab',
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
                fontFamily: 'RobotoSlab',
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
                    fontFamily: 'RobotoSlab',
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "PDL : ${infoTFT['leaguePoints']}",
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
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
    if (infoFlex.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Flex",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/UNRANKED.png',
            ),
            height: 300,
            width: 300,
          ),
          Text(
            "UNRANKED",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ],
      );
    } else
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Flex",
              style: TextStyle(
                fontFamily: 'RobotoSlab',
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
                fontFamily: 'RobotoSlab',
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
                    fontFamily: 'RobotoSlab',
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "PDL : ${infoFlex['leaguePoints']}",
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
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

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.network(
            "http://ddragon.leagueoflegends.com/cdn/9.21.1/img/profileicon/${resultID["profileIconId"]}.png",
            height: 200,
          ),
          Text(
            "Level : ${resultID['summonerLevel']}",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
