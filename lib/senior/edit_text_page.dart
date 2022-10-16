import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: EditTextPage(),
  ));
}

class EditTextPage extends StatefulWidget {
  const EditTextPage({Key? key}) : super(key: key);

  @override
  _EditTextPageState createState() => _EditTextPageState();
}

class _EditTextPageState extends State<EditTextPage>
    with WidgetsBindingObserver {
  late List<String> _list;
  double _keyboardHeight = 0.0;

  @override
  void initState() {
    _list = [
      "Item generated 0",
      "Item generated 1",
      "Item generated 2",
    ];
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Text Page"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_list[index]),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text("表情"),
                  Expanded(child: KEditText()),
                ],
              ),
            ),
            SizedBox(
              height: _keyboardHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class KEditText extends StatefulWidget {
  const KEditText({Key? key}) : super(key: key);

  @override
  _KEditTextState createState() => _KEditTextState();
}

class _KEditTextState extends State<KEditText> {
  late KEditTextController _editTextController;
  late FocusNode _focusNode;
  late TextStyle _textStyle;
  late Color _cursorColor;
  late Color _backgroundCursorColor;
  GlobalKey<EditableTextState>? _editableTextKey;

  @override
  void initState() {
    _editableTextKey = GlobalKey();
    _focusNode = FocusNode();
    _editTextController = KEditTextController();
    _textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
    _cursorColor = Colors.redAccent;
    _backgroundCursorColor = Colors.blueAccent;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: Colors.blue,)
        ),
      ),
      alignment: Alignment.center,
      child: EditableText(
        key: _editableTextKey,
        controller: _editTextController,
        focusNode: _focusNode,
        style: _textStyle,
        cursorColor: _cursorColor,
        backgroundCursorColor: _backgroundCursorColor,
        cursorHeight: 36,
      ),
    );
  }
}

class KEditTextController extends TextEditingController {

}
