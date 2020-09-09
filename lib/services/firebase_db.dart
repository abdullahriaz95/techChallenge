import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:tech_challange/inputFirebaseData.dart';
import 'package:tech_challange/models/video_data.dart';

class FirebaseFirestoreService {
  FirebaseFirestoreService();

  Future<ObservableList<VideoData>> getVideoListForUser() async {
    var funnyVideos = await FirebaseFirestore.instance.collection("data").doc("funny").collection("videos").get();
//    var animalsVideos = await FirebaseFirestore.instance.collection("data").doc("animals").collection("videos").get();
//    var musicVideos = await FirebaseFirestore.instance.collection("data").doc("music").collection("videos").get();
//    var footballVideos = await FirebaseFirestore.instance.collection("data").doc("football").collection("videos").get();


    var videoList = ObservableList<VideoData>();

    funnyVideos.docs.forEach((element) {
      VideoData video = VideoData.fromJson(element.data());
      videoList.add(video);
    });
//    animalsVideos.docs.forEach((element) {
//      VideoData video = VideoData.fromJson(element.data());
//      videoList.add(video);
//    });
//    footballVideos.docs.forEach((element) {
//      VideoData video = VideoData.fromJson(element.data());
//      videoList.add(video);
//    });
//    musicVideos.docs.forEach((element) {
//      VideoData video = VideoData.fromJson(element.data());
//      videoList.add(video);
//    });

    print('videolist size ${videoList.length}');
    return videoList;
  }

  Future<ObservableList<VideoData>> getSpecificCategoryVideoList(String category) async {
    var vids = await FirebaseFirestore.instance.collection("data").doc(category).collection("videos").get();


    var videoList = ObservableList<VideoData>();

    vids.docs.forEach((element) {
      VideoData video = VideoData.fromJson(element.data());
      videoList.add(video);
    });

    videoList.shuffle();
    print('vids size ${videoList.length}');
    return videoList;
  }

  //Working in User System
  Future<bool> removeVideosFromFeed(
      String userId, List<String> videoIds) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .update({"videosViewed": FieldValue.arrayUnion(videoIds)});
    return true;
  }

  Future<bool> clearHistory(String userId) async {
    var user =
        await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    var listToRemove = user.data()['videosViewed'];
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .update({"videosViewed": FieldValue.arrayRemove(listToRemove)});
    return true;
  }


  Future inputDataInFirebase() async{
    for (var video in funnyData) {
      await FirebaseFirestore.instance.collection("data").doc("funny").collection("videos").add(video);
    }
    for (var video in animalsData) {
      await FirebaseFirestore.instance.collection("data").doc("animals").collection("videos").add(video);
    }
    for (var video in footballData) {
      await FirebaseFirestore.instance.collection("data").doc("football").collection("videos").add(video);
    }
    for (var video in musicData) {
      await FirebaseFirestore.instance.collection("data").doc("music").collection("videos").add(video);
    }
  }



}
