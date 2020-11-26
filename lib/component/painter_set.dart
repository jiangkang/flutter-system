import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/component/painter/basic_shape.dart';
import 'package:flutter_system/component/painter/particles.dart';
import 'package:flutter_system/utils/nav_utils.dart';

class PainterDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painter Demos"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTileCard(
            title: Text("Basic Shape"),
            onTap: () {
              NavUtils.animToPage(context, BasicShapePage());
            },
          ),
          ListTileCard(
            title: Text("Basic Particles"),
            onTap: () {
              NavUtils.animToPage(context, BasicParticles());
            },
          ),
        ],
      ),
    );
  }
}
