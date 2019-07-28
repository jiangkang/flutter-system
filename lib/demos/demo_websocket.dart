import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketDemo extends StatefulWidget {
  @override
  _WebSocketDemoState createState() {
    return _WebSocketDemoState();
  }
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  final _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Form(
              child: TextFormField(
            controller: _controller,
            decoration: InputDecoration(labelText: "Send a message"),
          )),
          StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              "Tips",
                            ),
                            content: Text(
                                "You should science online if you are in china"),
                          ));
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(snapshot.hasData
                      ? "${snapshot.data}"
                      : "waiting response..."),
                );
              })
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: "Send Message",
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }
}
