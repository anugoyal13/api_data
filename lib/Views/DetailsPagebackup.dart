// import 'package:flutter/material.dart';
// import 'package:flutter_task/Models/MatchResponseback.dart';
// import 'package:flutter_task/Models/TeamResponsebackup.dart';
// import 'package:flutter_task/Services/DataService.dart';
//
// class DetailsPage extends StatefulWidget {
//   late String code;
//
//   DetailsPage({required this.code});
//
//   @override
//   _DetailsPageState createState() => _DetailsPageState();
// }
//
// class _DetailsPageState extends State<DetailsPage> {
//   DateTime dateTo = DateTime.now();
//   DateTime dateFrom = DateTime.now().subtract(const Duration(days: 30));
//   DataService dataServices = DataService();
//   late MatchResponse mResponse;
//   late List<Matches> matchesList = [];
//   late TeamResponse tResponse;
//   late List<Teams> teamsList=[];
//
//   int homeTeamCounter = 0;
//   int awayTeamCounter = 0;
//   late String winner;
//
//   // mostWins() async {
//   //   mResponse = await dataServices.getMatchData(widget.code);
//   //   mResponse.matches.forEach((match) {
//   //     if (match.score.winner == "HOME_TEAM")
//   //       winners.add(match.homeTeam.toJson());
//   //     else if (match.score.winner == "AWAY_TEAM")
//   //       winners.add(match.awayTeam.toJson());
//   //     else
//   //       draws.add(match.awayTeam.toJson());
//   //   });
//   //   winners.sort(
//   //   (a, b) => a['id'].compareTo(b['id']));
//   //   var map = Map();
//   //
//   //   winners.forEach((winner) {
//   //     if (!map.containsKey(winner['id'])) {
//   //       map[winner['id']] = 1;
//   //     } else {
//   //       map[winner['id']] += 1;
//   //     }
//   //   });
//   //   map.forEach((key, value) => winCount.add({"$key": value}));
//   //   winCount
//   //       .sort((a, b) => a.entries.first.value.compareTo(b.entries.first.value));
//   //   print(winCount.last.entries.first.key);
//   //   winner = teamList.singleWhere(
//   //           (element) => element.id == int.parse(winCount.last.entries.first.key));
//   //   print(winner?.name);
//   // }
//   mostWins() async {
//     mResponse = await dataServices.getMatchData(widget.code);
//     tResponse = await dataServices.getTeamData(widget.code);
//     teamsList = tResponse.teams;
//     matchesList = mResponse.matches;
//
//     for (int i = 0; i < matchesList.length; i++) {
//       if (mResponse.matches[i].score.winner.toString() == "HOME_TEAM") {
//         print("aadu");
//         homeTeamCounter = homeTeamCounter + 1;
//         print("${homeTeamCounter}");
//       } else if (mResponse.matches[i].score.winner.toString() == "AWAY_TEAM") {
//         awayTeamCounter = awayTeamCounter + 1;
//         print("${awayTeamCounter}");
//       } else
//         print("draw");
//     }
//    // setState(() {});
//     if (homeTeamCounter > awayTeamCounter) {
//       print("Home team wins");
//       print(homeTeamCounter);
//      // mResponse.match
//      // winner="HOME_TEAM";
//     } else {
//       winner="AWAY_TEAM";
//       print("Away team wins");
//     print(awayTeamCounter);
//   }
//
//   fetchMatchData() async {
//     mResponse = await dataServices.getMatchData(widget.code);
//     matchesList = mResponse.matches;
//     //mostWins();
//     setState(() {
// mostWins();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMatchData().whenComplete(() => {setState(() {})});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: FutureBuilder(
//                     future: dataServices.getMatchData(widget.code),
//                     builder: (context, snapshot) {
//                       print("anugoyal");
//                       if (snapshot.hasData) {
//                         print("goyal");
//
//                               return Card(
//                                   elevation: 15,
//                                   color: Colors.white,
//                                   shadowColor: Colors.lightBlue,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(25)),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//
//
//
//
//                                       // edate == mResponse.matches[0].season.endDate.toString()?
//                                       //  Text(mResponse.matches[index].score.winner.toString()): Text("no winner"),
//                                       // , style: const TextStyle(
//                                       //             fontSize: 20,
//                                       //             fontWeight: FontWeight
//                                       //                 .bold),),
//
//                                     ],
//                                   ));
//
//
//                       } else {
//                         return const CircularProgressIndicator();
//                       }
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
