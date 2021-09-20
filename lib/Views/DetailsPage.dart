import 'package:flutter/material.dart';
import 'package:flutter_task/Models/MatchResponse.dart';
import 'package:flutter_task/Services/DataService.dart';

class DetailsPage extends StatefulWidget {
  late String code;

  DetailsPage({required this.code});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  DateTime dateTo=DateTime.now();
  DateTime dateFrom=DateTime.now().subtract(const Duration(days:30));
  DataService dataServices = DataService();
  late MatchResponse mResponse;
  late List<Matches> matchesList = [];
  int homeTeamCounter=0;
  int awayTeamCounter=0;

  // mostWins() async {
  //   mResponse = await dataServices.getMatchData(widget.code);
  //   mResponse.matches.forEach((match) {
  //     if (match.score.winner == "HOME_TEAM")
  //       winners.add(match.homeTeam.toJson());
  //     else if (match.score.winner == "AWAY_TEAM")
  //       winners.add(match.awayTeam.toJson());
  //     else
  //       draws.add(match.awayTeam.toJson());
  //   });
  //   winners.sort(
  //   (a, b) => a['id'].compareTo(b['id']));
  //   var map = Map();
  //
  //   winners.forEach((winner) {
  //     if (!map.containsKey(winner['id'])) {
  //       map[winner['id']] = 1;
  //     } else {
  //       map[winner['id']] += 1;
  //     }
  //   });
  //   map.forEach((key, value) => winCount.add({"$key": value}));
  //   winCount
  //       .sort((a, b) => a.entries.first.value.compareTo(b.entries.first.value));
  //   print(winCount.last.entries.first.key);
  //   winner = teamList.singleWhere(
  //           (element) => element.id == int.parse(winCount.last.entries.first.key));
  //   print(winner?.name);
  // }
  mostWins() async{
    mResponse = await dataServices.getMatchData(widget.code);
    matchesList = mResponse.matches;
    for(int i=0; i<matchesList.length ; i++){
      if(mResponse.matches[i].score.winner.toString()=="HOME_TEAM"){
        homeTeamCounter+= homeTeamCounter;
      }
      else if (mResponse.matches[i].score.winner.toString()=="AWAY_TEAM"){
        awayTeamCounter+=awayTeamCounter;
      }
      else
        print("draw");

    }
    if(homeTeamCounter>awayTeamCounter){
      print("Home team wins");
      print(homeTeamCounter);
    }
    else  print("Away team wins");
    print(awayTeamCounter);
    }




  fetchMatchData() async {
    mResponse = await dataServices.getMatchData(widget.code);
    matchesList = mResponse.matches;
    mostWins();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchMatchData().whenComplete(() => {setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: FutureBuilder(
                    future: dataServices.getMatchData(widget.code),
                    builder: (context, snapshot) {
                      print("anugoyal");
                      if (snapshot.hasData) {
                        print("goyal");
                        return
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: matchesList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    elevation: 15,
                                    color: Colors.white,
                                    shadowColor: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        // edate == mResponse.matches[0].season.endDate.toString()?
                                        //  Text(mResponse.matches[index].score.winner.toString()): Text("no winner"),
                                        // , style: const TextStyle(
                                        //             fontSize: 20,
                                        //             fontWeight: FontWeight
                                        //                 .bold),),
                                        Text(
                                          mResponse.matches[index].score.winner
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ],
                                    ));
                                // } else throw Exception('no winner');
                              });
                              // } else throw Exception('no winner');

                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              )
            ],
          ),
        ),
      ),

    );
  }
}
