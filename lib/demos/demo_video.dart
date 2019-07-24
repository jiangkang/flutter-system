import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const String VIDEO_URL =
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

class VideoDemo extends StatefulWidget {
  @override
  _VideoDemoState createState() {
    return _VideoDemoState();
  }
}

class _VideoDemoState extends State<VideoDemo> {
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
//    _videoPlayerController = VideoPlayerController.network(VIDEO_URL);
    _videoPlayerController =
        VideoPlayerController.asset("assets/video/butterfly.mp4");
    _videoPlayerController.setLooping(true);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(_videoPlayerController.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              onPressed: () {
                                setState(() {
                                  if (_videoPlayerController.value.isPlaying) {
                                    _videoPlayerController.pause();
                                  } else {
                                    _videoPlayerController.play();
                                  }
                                });
                              })
                        ],
                      )
                    ],
                  );
                } else {
                  return Container(
                    width: double.maxFinite,
                    height: 160,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              })),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
