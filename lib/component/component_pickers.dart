import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/utils/pickers_utils.dart';
import 'package:video_player/video_player.dart';

class PickersPage extends StatefulWidget {

  const PickersPage({Key? key}) : super(key: key);

  @override
  State<PickersPage> createState() => _PickersPageState();
}

class _PickersPageState extends State<PickersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pickers"),
      ),
      body: ListView(
        children: [
          ListTileCard(
            leading: Icon(Icons.image),
            title: Text("Image Picker From Gallery"),
            onTap: () async {
              final file = await Pickers.pickImageFromGallery();
              if (!mounted) return;
              showImageDialog(context, file);
            },
          ),
          ListTileCard(
            leading: Icon(Icons.camera),
            title: Text("Image Picker From Camera"),
            onTap: () async {
              final file = await Pickers.pickImageFromCamera();
              if (!mounted) return;
              showImageDialog(context, file);
            },
          ),
          ListTileCard(
            leading: Icon(Icons.video_library),
            title: Text("Video Picker From Gallery"),
            onTap: () async {
              final file = await Pickers.pickVideoFromGallery();
              if (!mounted) return;
              showVideoDialog(context, file);
            },
          ),
          ListTileCard(
            leading: Icon(Icons.video_collection),
            title: Text("Video Picker From Camera"),
            onTap: () async {
              final file = await Pickers.pickVideoFromCamera();
              if (!mounted) return;
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
      builder: (context) => SizedBox(
        width: 100,
        height: 100,
        child: Image.file(file),
      ),
    );
  }

  void showVideoDialog(BuildContext context, File file) async {
    final controller = VideoPlayerController.file(file);
    await controller.initialize();
    await controller.play();
    await showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (context) => SizedBox(
        width: 100,
        height: 100,
        child: VideoPlayer(controller),
      ),
    );
  }
}
