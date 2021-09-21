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

  Future<MatchResponse> getMatchData(String comp_code,String dateTo,String dateFrom) async{
    final queryParams = {
      "dateFrom": "2021-09-01",
      "dateTo": "2021-09-20",
      "status": "FINISHED"
    };
    Uri uri = Uri(
        scheme: "http",
        host: "api.football-data.org",
        path: "/v2/competitions/2021/matches",
        queryParameters: queryParams);
    try {
      Response response = await get(
        uri,
        headers: {"X-Auth-Token": "27873aa8851b418ba6cc7d51defddce4"},
      );
    if(response.statusCode==200){
      print(response.statusCode);
      MatchResponse matchResponse=MatchResponse.fromJson(json.decode(response.body));
      print(matchResponse);
      return matchResponse;
    }
    else{
      print(response.statusCode);
      throw Exception("Invalid status code");
    }
    } catch (e) {
      return MatchResponse.fromJson({});
    }
  }
}