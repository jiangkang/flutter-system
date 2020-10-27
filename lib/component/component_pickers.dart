import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_system/utils/pickers_utils.dart';
import 'package:video_player/video_player.dart';

class PickersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pickers"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Image Picker From Gallery"),
            onTap: () async {
              final file = await Pickers.pickImageFromGallery();
              showImageDialog(context, file);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Image Picker From Camera"),
            onTap: () async {
              final file = await Pickers.pickImageFromCamera();
              showImageDialog(context, file);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text("Video Picker From Gallery"),
            onTap: () async {
              final file = await Pickers.pickVideoFromGallery();
              showVideoDialog(context, file);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_collection),
            title: Text("Video Picker From Camera"),
            onTap: () async {
              final file = await Pickers.pickVideoFromCamera();
              showVideoDialog(context, file);
            },
          ),
        ],
      ),
    );
  }

  void showImageDialog(BuildContext context, File file) async {
    await showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) => Container(
              width: 100,
              height: 100,
              child: Image.file(file),
            ));
  }

  void showVideoDialog(BuildContext context, File file) async {
    final _controller = VideoPlayerController.file(file);
    await _controller.initialize();
    await _controller.play();
    await showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (context) => Container(
              width: 100,
              height: 100,
              child: VideoPlayer(_controller),
            ));
  }
}
