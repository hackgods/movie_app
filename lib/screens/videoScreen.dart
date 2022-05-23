import 'package:auto_orientation/auto_orientation.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class VideoScreen extends StatefulWidget {
  String link;
  String name;
  String poster;

  VideoScreen({Key key,this.link, this.name, this.poster}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        widget.link,
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: widget.name,
        author: "MOVIES",
        imageUrl: widget.poster,
      ),
    );
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          fit: BoxFit.cover,
          handleLifecycle: true,
          autoDetectFullscreenDeviceOrientation: true,
          autoPlay: true,
          looping: true,
          fullScreenByDefault: true,


        ),
        betterPlayerDataSource: betterPlayerDataSource);

    _betterPlayerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.hideFullscreen) {
        Navigator.pop(context);
      }
      if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
        _betterPlayerController.setControlsEnabled(false);
      }

      if (event.betterPlayerEventType == BetterPlayerEventType.play) {
        _betterPlayerController.setControlsEnabled(true);
      }
    });

    AutoOrientation.landscapeAutoMode(forceSensor: true);

  }

  @override
  Widget build(BuildContext context) {


    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }
}
