import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_ui/builder/page_builder.dart';
import 'package:flutter_dynamic_ui/component/base_block.dart';
import 'package:flutter_dynamic_ui/component/base_card.dart';
import 'package:flutter_dynamic_ui/flutter_dynamic_ui.dart';
import 'package:flutter_dynamic_ui/manager/block_manager.dart';
import 'package:flutter_dynamic_ui/manager/card_manager.dart';
import 'package:flutter_dynamic_ui/manager/registry.dart';

class DynamicUIPage extends StatefulWidget {
  @override
  _DynamicUIPageState createState() => _DynamicUIPageState();
}

class _DynamicUIPageState extends State<DynamicUIPage> {
  @override
  void initState() {
    super.initState();
    CardManager.getInstance().addRegistry(MyCardRegistry());
    BlockManager.getInstance().addRegistry(MyBlockRegistry());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test App"),
      ),
      body: PageBuilder.buildPage(
          context, AssetParser().parsePageData("assets/json/basic.json")),
    );
  }
}

class MyCardRegistry extends CardRegistry {
  @override
  Map<String, BaseCard> getMap() {
    Map<String, BaseCard> map = new HashMap();
    map["card_type_0"] = Card_0();
    return map;
  }
}

class MyBlockRegistry extends BlockRegistry {
  @override
  Map<String, BaseBlock> getMap() {
    Map<String, BaseBlock> map = new HashMap();
    map["block_type_0"] = Block_0();
    return map;
  }
}

class Card_0 extends BaseCard {
  @override
  Widget createWidget(BuildContext context, CardData cardData) {
    List<BlockData> blocks = cardData.blockList;
    final blockWidgets = <Widget>[];
    blocks.forEach((block) {
      blockWidgets
          .add(BlockManager.getInstance().getBlockWidget(context, block));
    });
    return Column(
      children: blockWidgets,
    );
  }
}

class Block_0 extends BaseBlock {
  @override
  Widget createWidget(BuildContext context, BlockData data) {
    List<Meta> metaList = data.metaList;
    List<Btn> btnList = data.btnList;
    List<Img> imgList = data.imgList;
    return ListTile(
      leading: Image.network(
        imgList[0].url,
        width: 30,
        height: 30,
      ),
      title: Text(metaList[0].text),
      trailing: FlatButton(
        onPressed: () {},
        child: Text(btnList[0].text),
      ),
    );
  }
}
