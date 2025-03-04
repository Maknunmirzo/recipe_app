import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class RecipeViewVideoViewModel extends ChangeNotifier {
  final String videoUrl,title;

  RecipeViewVideoViewModel({required this.videoUrl,required this.title}) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    controller.initialize().then((value) {
      controller.play();
      notifyListeners();
    });
  timer= Timer.periodic(Duration(seconds: 1), (timer){
      notifyListeners();
    });
  }

  @override
  Future<void> dispose() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  late final VideoPlayerController controller;
  late final Timer timer;

  bool _isView = true;
  final double _volumeValue = 1;

  bool get isView => _isView;

  set isView(bool value) {
    _isView = !_isView;
    notifyListeners();
  }

  changeVolume({required bool isUp}) {
    if (isUp) {
      controller.setVolume(_volumeValue + 0.1);
    } else {
      controller.setVolume(_volumeValue - 0.1);
    }
    notifyListeners();
  }

  changeSpeed({required double speed}) {
    controller.setPlaybackSpeed(speed);
  }

  changePlaying() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    notifyListeners();
  }

  changePositionTime({required bool isAdd}) {
    if (isAdd) {
      controller.seekTo(controller.value.position + Duration(seconds: 10));
    } else {
      controller.seekTo(controller.value.position - Duration(seconds: 10));
    }
    notifyListeners();
  }

  String allVideoTime() {
    var time = controller.value.duration;
    int hours = time.inHours;
    int minutes = time.inMinutes ~/ 60 % 60;
    int seconds = time.inSeconds % 60;
    return "$hours:$minutes:$seconds";
  }

  Future<String> nowVideoTime() async {
    var time = controller.value.position;
    int hours = time.inHours;
    int minutes = time.inMinutes ~/ 60 % 60;
    int seconds = time.inSeconds % 60;
    return "$hours:$minutes:$seconds";
  }
}
