import 'dart:ui' as ui;

void main() {
  ui.window.onBeginFrame = (_) {
    final sceneBuilder = ui.SceneBuilder();
    ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    ui.Canvas canvas = ui.Canvas(pictureRecorder);
    canvas.drawColor(ui.Color(0xFFFFFFFF), ui.BlendMode.color);
    canvas.drawCircle(
        ui.Offset(ui.window.physicalSize.width / 2, ui.window.physicalSize.height / 2),
        36,
        ui.Paint()
          ..color = ui.Color(0xFFFF0000)
          ..strokeWidth = 12);
    ui.Picture picture = pictureRecorder.endRecording();
    sceneBuilder.addPicture(ui.Offset.zero, picture);
    final scene = sceneBuilder.build();
    ui.window.render(scene);
  };
  ui.window.scheduleFrame();
}
