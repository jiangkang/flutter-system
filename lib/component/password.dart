import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ActionType { paste, delete }

class PasswordBox extends StatefulWidget {
  /// Password num
  final int boxCount;

  final double boxWidth;

  final double boxHeight;

  final bool autoFocus;

  final Function onSubmit;

  final Function onClear;

  final double spaceBetween;

  final double containerHeight;

  final double containerWidth;

  final InputDecoration inputDecoration;

  final Icon clearIcon;

  final Icon pasteIcon;

  final bool enableActionButton;

  PasswordBox({
    this.boxCount = 4,
    this.boxWidth = 30,
    this.boxHeight = 60,
    this.autoFocus = true,
    this.onSubmit,
    this.onClear,
    this.spaceBetween = 20,
    this.containerWidth,
    this.containerHeight = 60,
    this.inputDecoration = const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: OutlineInputBorder(),
        counterText: ''),
    this.clearIcon = const Icon(Icons.backspace),
    this.pasteIcon = const Icon(Icons.content_paste),
    this.enableActionButton = false,
  });

  @override
  _PasswordBoxState createState() {
    return _PasswordBoxState();
  }
}

class _PasswordBoxState extends State<PasswordBox> {
  Widget _actionButton;
  List<FocusNode> _nodes;
  List<TextEditingController> _controllers;
  String _clipText;

  final _onchangeSinkCtrl = StreamController<FieldModel>();

  Sink<FieldModel> get onTextChange => _onchangeSinkCtrl.sink;

  @override
  void initState() {
    _actionButton = _buildActionButton();
    _nodes = List.generate(widget.boxCount, (index) => FocusNode());
    _controllers =
        List.generate(widget.boxCount, (index) => TextEditingController());
    _onchangeSinkCtrl.stream
        .distinct()
        .listen((FieldModel m) => _onTextChanged(m));
    checkClipboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      child: _buildTextFields(context),
    );
  }

  _buildTextFields(BuildContext context) {
    List<Widget> fields = List();
    for (int i = 0; i < widget.boxCount; i++) {
      fields.add(SizedBox(
        width: widget.boxWidth,
        height: widget.boxHeight,
        child: TextField(
          autofocus: i == 0 ? widget.autoFocus : false,
          decoration: widget.inputDecoration,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          textAlign: TextAlign.center,
          focusNode: _nodes[i],
          controller: _controllers[i],
          onChanged: (String value) {
            onTextChange.add(FieldModel(text: value, index: i));
          },
        ),
      ));
      if (i < widget.boxCount - 1) {
        fields.add(VerticalDivider(
          width: widget.spaceBetween,
          color: Colors.transparent,
        ));
      }
    }
    if (widget.enableActionButton) {
      fields.add(_actionButton);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: fields,
      verticalDirection: VerticalDirection.down,
    );
  }

  Widget _buildActionButton() {
    return StreamBuilder<ActionType>(
      stream: StreamController<ActionType>().stream,
      initialData: ActionType.paste,
      builder: (BuildContext context, AsyncSnapshot<ActionType> snapshot) {
        Widget button = Container();
        switch (snapshot.data) {
          case ActionType.paste:
            button = widget.pasteIcon;
            break;
          case ActionType.delete:
            button = widget.clearIcon;
            break;
        }
        return IconButton(
          icon: button,
          onPressed: () {},
        );
      },
    );
  }

  _onTextChanged(FieldModel model) {
    _focusNext(model.text, model.index);
  }

  _focusNext(String value, int index) {
    if (value.isNotEmpty) {
      if (index == widget.boxCount - 1) {
        _submit();
      } else {
        FocusScope.of(context).requestFocus(_nodes[index + 1]);
      }
    }
  }

  /// Get the text of the clipboard
  Future<bool> checkClipboard() async {
    ClipboardData clipboardData = await Clipboard.getData('text/plain');
    _clipText = clipboardData?.text ?? '';
    return _clipText.isNotEmpty;
  }

  void _submit() {
    for (int i = 0; i < widget.boxCount; ++i) {}
  }
}

class FieldModel {
  final int index;
  final String text;
  FieldModel({this.index, this.text});
}
