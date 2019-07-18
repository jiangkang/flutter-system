import 'package:flutter_system/common/res_constants.dart';
import 'package:flutter_system/component/case0.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ShowCase0 Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ShowCase0(
      radius: 10,
      imgUrl: IMG_URL0,
      title: "倚天屠龙记",
      avatarUrl: IMG_URL0,
      username: "赵敏",
      likeNum: 12,
    ));

    expect(find.text('倚天屠龙记'), findsOneWidget);
    expect(find.text('赵敏'), findsOneWidget);

    await tester.pump();
  });
}
