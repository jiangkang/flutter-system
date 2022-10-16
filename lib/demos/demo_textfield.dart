import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  String _value = "";

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller!.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text(_value),
          Row(
            children: <Widget>[
              Text("Default:"),
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    _value = value;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
