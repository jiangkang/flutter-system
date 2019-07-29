import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Flutter-System", () {
    final pageFinder = find.text("页面");
    final componentFinder = find.text("组件");
    final demoFinder = find.text("实例");
    final articleFinder = find.text("文章");

    FlutterDriver flutterDriver;
    setUpAll(() async {
      flutterDriver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver.close();
      }
    });

    test("page", () async {
      expect(await flutterDriver.getText(pageFinder), "页面");
      expect(await flutterDriver.getText(componentFinder), "组件");
      expect(await flutterDriver.getText(demoFinder), "实例");
      expect(await flutterDriver.getText(articleFinder), "文章");
    });

    test("component", () async {
      await flutterDriver.tap(componentFinder);

      expect(await flutterDriver.getText(componentFinder), "组件");
    });
  });
}
