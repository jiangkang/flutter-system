import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_safearea.dart';
import 'package:flutter_system/home.dart';
import 'package:flutter_system/widgets/demo_container.dart';
import 'package:flutter_system/widgets/demo_text.dart';

final Map<String, WidgetBuilder> pageRouters = {
  "/": (BuildContext context) => HomePage(),
  "/text": (BuildContext context) => TextDemo(),
  "/container": (BuildContext context) => ContainerDemo(),
  "/safearea": (BuildContext context) => SafeAreaDemo(),
};
