import 'package:flutter/material.dart';

/// Forms Demo
class FormsDemo extends StatefulWidget {
  @override
  _FormsDemoState createState() {
    return _FormsDemoState();
  }
}

class _FormsDemoState extends State<FormsDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forms Demo"),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("用户名："),
                    Expanded(
                        child: TextFormField(
                      validator: _validateFiledValue,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("密   码："),
                    Expanded(
                        child: TextFormField(
                      validator: _validateFiledValue,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (BuildContext context) {
                    return RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                        _login(context);
                      },
                      child: Center(child: Text("登录")),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    "没有账号？点击这里注册",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validateFiledValue(String value) {
    if (value.isEmpty) {
      return "内容不能为空";
    } else {
      return null;
    }
  }

  void _login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("恭喜你，登录成功")));
    }
  }
}
