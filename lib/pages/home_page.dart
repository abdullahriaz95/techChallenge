import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_challange/helpers/pref.dart';
import 'package:tech_challange/models/video_data.dart';
import 'package:tech_challange/pages/navbar.dart';
import 'package:tech_challange/services/firebase_db.dart';
import 'package:tech_challange/store/homestate.dart';
import 'package:tech_challange/store/intereststate.dart';
import 'package:tech_challange/styles.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeState _homeState = HomeState();
  final InterestSelectionState _interestSelectionState =
      InterestSelectionState();
  Stream<List<VideoData>> listVideos;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      FutureBuilder(
        future: Future.wait([
          Prefs.animalsSelected,
          Prefs.musicSelected,
          Prefs.footballSelected,
          Prefs.funnySelected
        ]),
        initialData: null,
        builder: (builder, prefsSnapshot) {
          if (prefsSnapshot != null &&
              prefsSnapshot.connectionState == ConnectionState.done) {
            if (prefsSnapshot.data != null) {
              if (prefsSnapshot.data[0] == true) {
                _interestSelectionState.changeAnimalsSelected(true);
              }
              if (prefsSnapshot.data[1] == true) {
                _interestSelectionState.changeMusicSelected(true);
              }
              if (prefsSnapshot.data[2] == true) {
                _interestSelectionState.changeFootballSelected(true);
              }
              if (prefsSnapshot.data[3] == true) {
                _interestSelectionState.changeFunnySelected(true);
              }
            }

            return Observer(builder: (context) {
              print(
                  'Observer Built videomanager list size ${_homeState.videoManager.listVideos.length}');
              return Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    _getVideoLayer(_homeState),
                    _getMiddleLayout(),
                    Positioned(
                      left: 30,
                      width: MediaQuery.of(context).size.width - 60,
                      bottom: 10,
                      child: NavBar(_homeState, _interestSelectionState),
                    ),
                  ],
                ),
              );
            });
          } else {
            return Center(
              child: loader,
            );
          }
        },
      ),
    );
  }

  Widget _getTopSection() {
    return Container(
      height: 100,
      color: Colors.transparent,
    );
  }

  Widget _getBottomSection() {
    return Container(
      height: 80,
      color: Colors.transparent,
    );
  }

  Widget _getMiddleSection() {
    return Expanded(
      child: Row(
        children: [
          _getVideoDescriptionSection(),
          _getActionsToolbar(),
        ],
      ),
    );
  }

  Widget _getMiddleLayout() {
    return IgnorePointer(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            _getTopSection(),
            _getMiddleSection(),
            _getBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _getVideoDescriptionSection() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
              child: (_homeState.videoManager.listVideos.length > 0
                  ? Text(
                      _homeState
                          .videoManager.listVideos[_homeState.index].category,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  : Container()))
        ],
      ),
    );
  }

  Widget _getActionsToolbar() {
    return Container(
      width: 100,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.favorite,
            size: 20,
            color: Colors.red,
          ),
          SizedBox(
            height: 4,
          ),
          (_homeState.videoManager.listVideos.length > 0
              ? Text(
                  _homeState.videoManager.listVideos[_homeState.index].likes,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white),
                )
              : Container()),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  _getVideoLayer(HomeState homeState) {
    return Container(
      color: Colors.white,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (homeState.videoManager.listVideos.length > 0) {
            VideoData videoData = homeState.videoManager.listVideos[homeState.index];

            print(videoData.category);
            print(videoData.url);
            return _getVideoCard(videoData);
          } else {
            return Center(
              child: loader,
            );
          }
        },
        controller: PageController(initialPage: 0, viewportFraction: 1),
        onPageChanged: (index) {
          //change video from video player here
          index = index % (homeState.videoManager.listVideos.length);
          _homeState.changeVideo(index);
//          if(index == 2){
//            _homeState.changeVideo(0);
//          }else{
//            _homeState.changeVideo(++index);
//          }
        },
      ),
    );
  }

  _getVideoCard(VideoData videoData) {
    var controller = videoData.videoPlayerController;
    print("controller $controller");
//    print("controller value ${controller.value}");

    return controller != null && controller.value.initialized
        ? GestureDetector(
            onTap: () {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            },
            child: SizedBox.expand(
                child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                  width: controller.value.size?.width ?? 0,
                  height: controller.value.size?.height ?? 0,
                  child: VideoPlayer(controller)),
            )))
        : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              LinearProgressIndicator(),
              SizedBox(
                height: 56,
              )
            ],
          );
  }
}
