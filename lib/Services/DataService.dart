import 'package:flutter_task/Models/MatchResponse.dart';
import 'package:flutter_task/Models/TeamResponse.dart';
import 'package:http/http.dart';
import 'dart:convert';

class DataService{

  Future<TeamResponse> getTeamData(String comp_code) async{
    Response response= await get(Uri.parse("http://api.football-data.org/v2/competitions/${comp_code}/teams"),
        headers:{
          "X-Auth-Token":"27873aa8851b418ba6cc7d51defddce4"
        });
    if(response.statusCode==200){
      print(response.statusCode);
      var temp =  jsonDecode(response.body);
      TeamResponse teamResponse = TeamResponse.fromJson(temp);
      return teamResponse;
    }
    else{
      throw Exception("Invalid status code");
    }
  }

  Future<MatchResponse> getMatchData(String comp_code,) async{
    Response response= await get(Uri.parse("http://api.football-data.org/v2/competitions/${comp_code}/matches"),
        headers:{
          "X-Auth-Token":"27873aa8851b418ba6cc7d51defddce4"
        });
    if(response.statusCode==200){
      print(response.statusCode);
      MatchResponse matchResponse=MatchResponse.fromJson(json.decode(response.body));
      print(matchResponse);
      return matchResponse;
    }
    else{
      throw Exception("Invalid status code");
    }
  }
}