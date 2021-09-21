import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/Models/TeamResponse.dart';
import 'package:flutter_task/Services/DataService.dart';
import 'package:flutter_task/Views/DetailsPage.dart';

class TeamPage extends StatefulWidget {
  late String code;
  TeamPage({required this.code});
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  DataService dataServices = DataService();
  late TeamResponse tResponse;
  late List<Teams> teamsList = [];

  fetchTeamData() async {
    tResponse = await dataServices.getTeamData(widget.code);
    teamsList = tResponse.teams;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTeamData().whenComplete(() => {setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Text(
              "Go",
              style: TextStyle(color:Colors.white,fontSize: 30, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailsPage(code:widget.code
                            ,
                           )));
            }),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 5,
          title: Text(
            " Participants Teams ",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'Overpass'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: FutureBuilder(
                    future: dataServices.getTeamData(widget.code),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: teamsList.length,
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
                                        tResponse.teams[index].name.toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                            height: 80,
                                            width: 80,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: SvgPicture.network(
                                                  tResponse
                                                      .teams[index].crestUrl,
                                                  fit: BoxFit.cover,
                                                ))),
                                      ),
                                    ],
                                  ));
                              // } else throw Exception('no winner');
                            });
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
