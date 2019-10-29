import 'package:flutter/material.dart';
import 'package:lol_app/app/pages/summoner_info/summoner_info_page.dart';
import 'package:lol_app/app/repositories/champion_name_repository.dart';

List matches = resultMatches['matches'];
Map match;


class Item {

  

  getMatch(int i) {
    match = matches[i];
    int champID = match["champion"];
    return Container(
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "http://ddragon.leagueoflegends.com/cdn/9.21.1/img/champion/Aatrox.png"),
          ),
          title: Text('Champion Name'),
          subtitle: Text('${match["lane"]}'),
          trailing: Icon(Icons.arrow_forward),
          isThreeLine: true,
        ),
      ),
    );
  }
}
