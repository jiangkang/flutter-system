// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
//
// /// Camera demo
// class CameraDemo extends StatefulWidget {
//   @override
//   _CameraDemoState createState() {
//     return _CameraDemoState();
//   }
// }
//
// class _CameraDemoState extends State<CameraDemo> {
//   CameraController _cameraController;
//   Future<void> _initControllerFuture;
//
//   Future<CameraDescription> _getFirstCamera() async {
//     final cameras = await availableCameras();
//     return cameras.first;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getFirstCamera().then((value) {
//       _cameraController = CameraController(value, ResolutionPreset.medium);
//       _cameraController.initialize().then((_) {
//         if (!mounted) {
//           return;
//         }
//         setState(() {});
//       });
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var bodyView;
//     if (!_cameraController.value.isInitialized) {
//       bodyView = Center(
//         child: Text("Not Initialize"),
//       );
//     } else {
//       bodyView = AspectRatio(
//           aspectRatio: _cameraController.value.aspectRatio,
//           child: CameraPreview(_cameraController));
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Camera Demo"),
//         centerTitle: true,
//       ),
//       body: SafeArea(child: bodyView),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await _initControllerFuture;
//           final path = join(
//               (await getTemporaryDirectory()).path, "${DateTime.now()}.png");
//           await _cameraController.takePicture(path);
//           await showDialog<void>(
//             context: context,
//             builder: (context) => Center(
//               child: SizedBox(
//                 width: 360,
//                 child: Image.file(
//                   File(path),
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Icon(Icons.camera),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     super.dispose();
//   }
// }
