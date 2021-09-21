import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Models/MatchResponse.dart';
import 'package:flutter_task/Models/TeamResponse.dart';
import 'package:flutter_task/Services/DataService.dart';
import 'package:flutter_task/Views/Widgets/ResponsiveWidget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class DetailsPage extends StatefulWidget {
  late String code;
  DetailsPage({required this.code});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DataService dataServices = DataService();
  late TeamResponse tResponse;
  late List<Teams> teamList = [];
  late List<Map<String, dynamic>> winners = [];
  late List<Map<String, dynamic>> draws = [];
  late List<Map<String, dynamic>> winCount = [];
  late MatchResponse matchResponse;
  Teams? winner;

  fetchTeamData() async {
    tResponse = await dataServices.getTeamData(widget.code);
    teamList = tResponse.teams;

    await mostWins(tResponse.season.endDate);
    setState(() {});
  }

  mostWins(String endDate) async {
    matchResponse = await dataServices.getMatchData(
        widget.code,
        DateTime.parse(endDate).subtract(Duration(days: 30)).toString(),
        DateTime.now().toString());
    print(matchResponse.toJson());
    matchResponse.matches.forEach((match) {
      if (match.score.winner == "HOME_TEAM")
        winners.add(match.homeTeam.toJson());
      else if (match.score.winner == "AWAY_TEAM")
        winners.add(match.awayTeam.toJson());
      else
        draws.add(match.awayTeam.toJson());
    });
    winners.sort((a, b) => a['id'].compareTo(b['id']));
    var map = Map();

    winners.forEach((winner) {
      if (!map.containsKey(winner['id'])) {
        map[winner['id']] = 1;
      } else {
        map[winner['id']] += 1;
      }
    });
    map.forEach((key, value) => winCount.add({"$key": value}));
    winCount
        .sort((a, b) => a.entries.first.value.compareTo(b.entries.first.value));
    print(winCount.last.entries.first.key);
    winner = teamList.singleWhere(
        (element) => element.id == int.parse(winCount.last.entries.first.key));
    print(winner?.name);
  }

  late ConfettiController _controllerCenter;
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    super.initState();
    fetchTeamData();
    setState(() {});
  }

  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: SafeArea(
          child: SingleChildScrollView(
            child: ResponsiveWidget(
              mobile: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Container(
                      margin: EdgeInsets.symmetric(),
                      height: 70,
                      width: 450,
                      child: Center(
                        child: Flexible(
                          child: Text(
                            " The team who won the most matches ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: "Playball"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  FadeInImage.memoryNetwork(
                    alignment: Alignment.center,
                    placeholder: kTransparentImage,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.cover,
                    fadeOutCurve: Curves.easeInOut,
                    fadeInDuration: Duration(seconds: 1),
                    fadeOutDuration: Duration(seconds: 2),
                    image:
                        'https://image.freepik.com/free-photo/finger-conference-row-competition-training_1134-884.jpg',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    blastDirection: -pi / 2,
                    emissionFrequency: 0.01,
                    numberOfParticles: 30,
                    maxBlastForce: 100,
                    minBlastForce: 80,
                    //gravity: 0.3,

                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.black,
                      Colors.purple,
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(),
                    child: FutureBuilder(
                        future: dataServices.getTeamData(widget.code),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black12),
                                child: TextButton(
                                  onPressed: () {
                                    _controllerCenter.play();
                                  },
                                  child: Card(
                                      elevation: 15,
                                      color: Colors.white,
                                      shadowColor: Colors.lightBlue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height *
                                            0.3,
                                        width:
                                        MediaQuery.of(context).size.width * 0.7,

                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        winner?.name.toString() ??
                                                            " ",
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Center(
                                                      child: Text(
                                                        winner?.tla.toString() ??
                                                            " ",
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Center(
                                                      child: Text(
                                                        winner?.address
                                                                .toString() ??
                                                            " ",
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ));
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ),
                ],
              ),
              tab: Row(
                children: [
                  FadeInImage.memoryNetwork(
                    alignment: Alignment.center,
                    placeholder: kTransparentImage,
                    height: 250,
                    width: 300,
                    fit: BoxFit.cover,
                    fadeOutCurve: Curves.easeInOut,
                    fadeInDuration: Duration(seconds: 1),
                    fadeOutDuration: Duration(seconds: 2),
                    image:
                        'https://image.freepik.com/free-photo/finger-conference-row-competition-training_1134-884.jpg',
                  ),
                  ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    blastDirection: -pi / 2,
                    emissionFrequency: 0.01,
                    numberOfParticles: 30,
                    maxBlastForce: 100,
                    minBlastForce: 80,

                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.black,
                      Colors.purple,
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Container(
                          margin: EdgeInsets.symmetric(),
                          height: 70,
                          width: 450,
                          child: Center(
                            child: Flexible(
                              child: Text(
                                " The Team who won the most matches",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: "Playball"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: FutureBuilder(
                            future: dataServices.getTeamData(widget.code),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black12),
                                    child: TextButton(
                                      onPressed: () {
                                        _controllerCenter.play();
                                      },
                                      child: Card(
                                          elevation: 15,
                                          color: Colors.white,
                                          shadowColor: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Center(
                                                    child: Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            winner?.name
                                                                    .toString() ??
                                                                " ",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 3,
                                                            style: const TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            winner?.tla
                                                                    .toString() ??
                                                                " ",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 3,
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            winner?.address
                                                                    .toString() ??
                                                                " ",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 3,
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ));
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
