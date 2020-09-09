import 'dart:convert';

import 'package:video_player/video_player.dart';

List<VideoData> videoDataFromJson(String str) => List<VideoData>.from(json.decode(str).map((x) => VideoData.fromJson(x)));

String videoDataToJson(List<VideoData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoData {
  VideoData({
    this.videoTitle,
    this.url,
    this.likes,
    this.category,
  });

  String videoTitle;
  String url;
  String likes;
  String category;

  VideoPlayerController videoPlayerController;

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
    videoTitle: json["videoTitle"],
    url: json["url"],
    likes: json["likes"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "video_title": videoTitle,
    "url": url,
    "likes": likes,
    "category": category,
  };


  setupVideo(){
    videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        videoPlayerController.setLooping(true);
      });
  }
}
