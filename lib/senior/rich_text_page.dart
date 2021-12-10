import 'package:flutter/material.dart';

/// 富文本基本需求：
/// 1. Emoji
/// 2. 链接
/// 3. 单选/多选
/// 4. item list
/// 5. color/textStyle
/// 6. quote
/// 7. image
/// 8. audio
/// 9. video
/// 10.link Card
/// 11.table
/// 12.其他自定义形式
/// 设计要求：
/// 1. 输入普通文本，内部进行匹配，分发，渲染；
/// 2. 既然是普通文本，这就涉及协议的设计，用来识别不同的类型；
/// 3. 两种方式，一个是默认的协议设计，一个支持自定义协议的设计；
/// 4. 灵活匹配各种builder，支持外部传入
void main() {
  runApp(MaterialApp(
    home: RichTextPage(),
  ));
}

class RichTextPage extends StatefulWidget {
  const RichTextPage({Key key}) : super(key: key);

  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rich Text"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text.rich(TextSpan(
                children: [
                  TextSpan(text: "普通文本", style: TextStyle(color: Colors.black)),
                  WidgetSpan(
                    child: Icon(
                      Icons.all_inclusive_rounded,
                      color: Colors.red,
                    ),
                  ),
                  WidgetSpan(
                      child: Checkbox(value: false, onChanged: (value) {})),
                ],
              )),
            ),

            /// [圆嘴],[生气],[笑眯眼]
            ListTile(
              title: Text("Emoji"),
              subtitle: RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                      child: Image.asset(
                    "assets/emojis/angry_face.png",
                    width: 20,
                    height: 20,
                  )),
                  WidgetSpan(
                      child: Image.asset(
                    "assets/emojis/circle_face.png",
                    width: 20,
                    height: 20,
                  )),
                  WidgetSpan(
                      child: Image.asset(
                    "assets/emojis/smile_face.png",
                    width: 20,
                    height: 20,
                  )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
