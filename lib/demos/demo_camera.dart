import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Camera demo
class CameraDemo extends StatefulWidget {
  @override
  _CameraDemoState createState() {
    return _CameraDemoState();
  }
}

class _CameraDemoState extends State<CameraDemo> {
  CameraController _cameraController;
  Future<void> _initControllerFuture;

  Future<CameraDescription> _getFirstCamera() async {
    final cameras = await availableCameras();
    return cameras.first;
  }

  @override
  void initState() {
    super.initState();
    _getFirstCamera().then((value) {
      _cameraController = CameraController(value, ResolutionPreset.medium);
      _initControllerFuture = _cameraController.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: _initControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _initControllerFuture;
          final path = join(
              (await getTemporaryDirectory()).path, "${DateTime.now()}.png");
          await _cameraController.takePicture(path);
        },
        child: Icon(Icons.camera),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
