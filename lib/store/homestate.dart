import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tech_challange/helpers/pref.dart';
import 'package:tech_challange/managers/video_manager.dart';
import 'package:tech_challange/services/firebase_db.dart';
import 'package:tech_challange/models/video_data.dart';
import '../category_names.dart';
import 'dart:core';

part 'homestate.g.dart';
class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store{
  FirebaseFirestoreService _firebaseFirestoreService;

  /*
  * For Category Slider
  *
  * */
  @observable
  String category = FUNNY;

  @action
  void changeCategory(String newCategory){
    this.category = newCategory;
    changeNextVideos(category);
  }




  /*
  * For Video
  *
  * */

  @observable
  VideoManager videoManager;

  @observable
  ObservableList<VideoData> observableList = ObservableList();

  @observable
  int index = 0;

  _HomeState(){
    _firebaseFirestoreService = FirebaseFirestoreService();
    videoManager = VideoManager();
    loadVideos();
  }

  void loadVideos() async {
    videoManager.listVideos = await _firebaseFirestoreService.getVideoListForUser();
    await videoManager.loadVideo(0);
    videoManager.playVideo(0);
    videoManager.loadVideo(1);
    videoManager = videoManager;
  }

  void changeNextVideos( String category) async{
    print("index right now: $index");
    videoManager.categoryChanged(index);
    ObservableList<VideoData> observableList = new ObservableList();
    observableList.add(videoManager.listVideos[index]);
    ObservableList<VideoData> obl = await _firebaseFirestoreService.getSpecificCategoryVideoList(category);
    obl.forEach((element) {
      observableList.add(element);
    });
    videoManager.listVideos = observableList;
    videoManager.prevPage = 0;
    index = 0;
  }

  @action
  changeVideo(int index)async {
    await videoManager.changeVideo(index);
    this.index = index;
    videoManager = videoManager;
  }









}