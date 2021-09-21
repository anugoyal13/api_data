import 'package:flutter/material.dart';
import 'package:flutter_task/Views/TeamPage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Widgets/Widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
          children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              'Football League',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 550,
            width: 1150,
            child: ListView(children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  GestureDetector(
                    child: LeagueContainer('assets/pl.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamPage(code: 'PL')));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer('assets/laliga.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamPage(code: 'PD'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer('assets/bundesliga.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamPage(code: 'BL1'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer('assets/seria.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamPage(code: 'SA'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer('assets/ligue1.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamPage(code: 'FL1'),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: LeagueContainer('assets/nos.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamPage(code: 'PPL'),
                          ));
                    },
                  ),
                ],
              ),
            ]),
          ),

          //   ],
          // ),
        ],
      ).scrollVertical(),
    ));
  }
}
