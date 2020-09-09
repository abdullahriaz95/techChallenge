import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tech_challange/models/video_data.dart';
import 'package:video_player/video_player.dart';

class VideoManager {
//  State<Home> state;
  Function updateController;

  ObservableList<VideoData> listVideos;
  var prevPage = 0;

//  Sink<List<VideoData>> stream;

  VideoManager() {
    listVideos = ObservableList();
  }

  changeVideo(index) async {
    int prev = index > prevPage ? index - 2 : index + 2;
    if (listVideos[prevPage].videoPlayerController != null)
      listVideos[prevPage].videoPlayerController.pause();
    prevPage = index;

    disposeVideo(prev);
    await loadVideo(index);
    listVideos[index].videoPlayerController.play();
    if (index + 1 < listVideos.length) {
      int nIndex = index + 1;
      loadVideo(nIndex);
    }
//    stream.add(listVideos);
  }

  categoryChanged(int index) {
    if (index + 1 < listVideos.length) {
      int nIndex = index + 1;
      disposeVideo(nIndex);
    }
    if (index - 1 >= 0) {
      int pIndex = index - 1;
      disposeVideo(pIndex);
    }
  }

  VideoData getVideo(index) {
    return listVideos[index];
  }

  VideoPlayerController getController(index) {
    return listVideos[index].videoPlayerController;
  }

  playVideo(index) {
    if (listVideos[index].videoPlayerController != null) {
      listVideos[index].videoPlayerController.play();
    }
  }

  pauseVideo(index) {
    if (listVideos[index].videoPlayerController != null) {
      listVideos[index].videoPlayerController.pause();
    }
  }

  loadVideo(index) async {
    if (listVideos[index].videoPlayerController == null) {
      listVideos[index].videoPlayerController =
          await createController(listVideos[index].url);

      print("loadView index $index : ${listVideos[index].category}");
      print(
          "VideoPlayerController index $index : ${listVideos[index].videoPlayerController}");
//      stream.add(listVideos);
    }
  }

  disposeVideo(index) {
    if (index >= 0 && index < listVideos.length ) {
      if (listVideos[index].videoPlayerController != null) {
        listVideos[index].videoPlayerController.dispose();
        listVideos[index].videoPlayerController = null;
      }
    }
  }

  Future<VideoPlayerController> createController(url) async {
    VideoPlayerController controller = VideoPlayerController.network(url);
    await controller.initialize();
    controller.setLooping(true);
    return controller;
  }

  bool hasVideos() {
    if (listVideos.length > 0) return true;
    return false;
  }

  int numOfVideos() {
    return listVideos.length;
  }

  dispose() {
    listVideos.forEach((element) {
      if (element.videoPlayerController != null) {
        element.videoPlayerController.dispose();
      }
    });
  }
}
