import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_challange/helpers/pref.dart';
import 'package:tech_challange/pages/interest_selection_page.dart';
import 'package:tech_challange/pages/home_page.dart';
import 'package:tech_challange/pages/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tech_challange/styles.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.raleway().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot != null &&
              snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
                initialData: null,
                future: Prefs.onboarding,
                builder: (buildContext, onboardingSnapshot) {
                  if (onboardingSnapshot.data == false &&
                      onboardingSnapshot.connectionState ==
                          ConnectionState.done) {
                    return InterestSelectionPage();
                  } else if (onboardingSnapshot.data == true &&
                      onboardingSnapshot.connectionState ==
                          ConnectionState.done) {
                    return HomePage();
                  }

                  return loader;
                });
          } else
            return Center(
              child: Text('Firebase Loading...'),
            );
        },
      ),
    );
  }
}

