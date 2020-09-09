import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tech_challange/pages/home_page.dart';
import 'package:tech_challange/services/firebase_db.dart';
import 'package:tech_challange/store/intereststate.dart';
import 'package:tech_challange/styles.dart';

class InterestSelectionPage extends StatefulWidget {
  @override
  _InterestSelectionPageState createState() => _InterestSelectionPageState();
}

class _InterestSelectionPageState extends State<InterestSelectionPage>
    with SingleTickerProviderStateMixin {
  InterestSelectionState interestSelectionState = InterestSelectionState();

  @override
  void initState() {
    super.initState();

//    FirebaseFirestoreService firebaseFirestoreService = FirebaseFirestoreService();
//    firebaseFirestoreService.inputDataInFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 70, 0, 0),
              child: Text(
                'Choose your interest',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if(interestSelectionState.animalsSelected)
                              interestSelectionState.changeAnimalsSelected(false);
                              else
                                interestSelectionState.changeAnimalsSelected(true);

                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              width:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              child: Card(
                                elevation: 4.0,
                                color: interestSelectionState.animalsSelected
                                    ? Colors.pink[100]
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/animals.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    Text('Animals',
                                        style: interestSelectionTextStyle),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 24,
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if(interestSelectionState.footballSelected)
                              interestSelectionState.changeFootballSelected(false);
                              else
                                interestSelectionState.changeFootballSelected(true);

                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              width:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              child: Card(
                                elevation: 4.0,
                                color: interestSelectionState.footballSelected
                                    ? Colors.pink[100]
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/football.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    Text('Football',
                                        style: interestSelectionTextStyle),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if(interestSelectionState.funnySelected)
                              interestSelectionState.changeFunnySelected(false);
                              else
                                interestSelectionState.changeFunnySelected(true);

                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              width:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              child: Card(
                                elevation: 4.0,
                                color: interestSelectionState.funnySelected
                                    ? Colors.pink[100]
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/funny.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    Text('Funny',
                                        style: interestSelectionTextStyle),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 24,
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (interestSelectionState.musicSelected)
                                interestSelectionState
                                    .changeMusicSelected(false);
                              else
                                interestSelectionState
                                    .changeMusicSelected(true);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              width:
                                  MediaQuery.of(context).size.shortestSide / 2 -
                                      32,
                              child: Card(
                                elevation: 4.0,
                                color: interestSelectionState.musicSelected
                                    ? Colors.pink[100]
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/music.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    Container(
                                      height: 12,
                                    ),
                                    Text('Music',
                                        style: interestSelectionTextStyle),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 24, 40),
              child: Align(
                alignment: Alignment.topRight,
                child: interestSelectionState.animalsSelected ||
                        interestSelectionState.funnySelected ||
                        interestSelectionState.footballSelected ||
                        interestSelectionState.musicSelected
                    ? GestureDetector(
                        onTap: () {
                          interestSelectionState.changeOboardingPref();
                          Navigator.pushReplacement(
                              context,
                              Platform.isAndroid
                                  ? MaterialPageRoute(
                                      builder: (context) => HomePage())
                                  : CupertinoPageRoute(
                                      builder: (context) => HomePage()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.pink[100]),
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.red[900],
                              size: 40,
                            )),
                      )
                    : Container(
                        height: 40,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
