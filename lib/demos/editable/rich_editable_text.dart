import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demos.dart';

void main() {
  runDemo(RichEditableTextDemo());
}

class RichTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    String originText = value.text;
    if (originText.isEmpty) {
      return super.buildTextSpan(context: context, style: style, withComposing: withComposing);
    }
    return _handleRichTextSpan(originText, style, withComposing);
  }

  TextSpan _handleRichTextSpan(String content, TextStyle? style, bool withComposing) {
    final List<InlineSpan> inlineSpanList = [];
    RegExp regExp = RegExp(r'^{\[}[a-zA-Z]+(\])$');
    regExp.allMatches(content).forEach((match) {
      int start = match.start;
      int end = match.end;
      String matchedText = content.substring(start,end);
      debugPrint(">>> "+ matchedText);
    });
    if (content.startsWith("@") && content.endsWith(" ")) {
      InlineSpan span = WidgetSpan(
          child: Text(
        content,
        style: style?.copyWith(color: Colors.redAccent) ?? TextStyle(color: Colors.red),
      ));
      inlineSpanList.add(span);
    } else {
      inlineSpanList.add(TextSpan(text: content,style: TextStyle(color: Colors.black)));
    }
    debugPrint("$inlineSpanList");
    selection = TextSelection.collapsed(offset: content.length);
    return TextSpan(children: inlineSpanList, style: style ?? TextStyle(color: Colors.black));
  }
}

class RichEditableTextDemo extends StatefulWidget {
  const RichEditableTextDemo({Key? key}) : super(key: key);

  @override
  _RichEditableTextDemoState createState() => _RichEditableTextDemoState();
}

class _RichEditableTextDemoState extends State<RichEditableTextDemo> {
  late RichTextEditingController _richTextEditingController;

  @override
  void initState() {
    _richTextEditingController = RichTextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: null,
        expands: true,
        decoration: InputDecoration(border: OutlineInputBorder()),
        controller: _richTextEditingController,
        onChanged: (content) {
          debugPrint("onChanged");
        },
      ),
    );
  }
}
