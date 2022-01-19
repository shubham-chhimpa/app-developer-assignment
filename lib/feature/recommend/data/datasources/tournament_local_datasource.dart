import 'dart:convert';

import 'package:appdevassignment/feature/recommend/domain/entities/tournament.dart';
import 'package:http/http.dart' as http;
abstract class TournamentDataSource {
  Future<List<Tournament>> getTournaments();
}

class TournamentLocalDataSource implements TournamentDataSource{
  @override
  Future<List<Tournament>> getTournaments() async{

    List<Tournament> tournaments = [];
    var client = http.Client();

    try {
      var response = await client.get(Uri.parse("http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all"));
     // print(response.body);
      Map<String,dynamic> parsed = json.decode(response.body);

      parsed['data']['tournaments'].forEach((val){
        final Tournament tournament = Tournament.fromJson(val);
        tournaments.add(tournament);
      });
    } finally {
      client.close();
    }

    return Future.value(tournaments);
  }


}