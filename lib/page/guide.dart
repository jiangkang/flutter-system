import 'package:flutter/material.dart';

class GuideData {
  String imgUrl;
  String title;
  String desc;

  GuideData(this.imgUrl, this.title, this.desc);
}

/// Guide Page
class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final List<GuideData> data = List();

  int _itemCount;

  ValueChanged<int> _onPageChanged;

  int _currentIndex;

  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    data.add(GuideData("landscape0.jpeg", "好看", "Just for beautiful"));
    data.add(GuideData("landscape1.jpeg", "好玩", "Just for fun"));
    data.add(GuideData("landscape2.jpeg", "好用", "Juest for usage"));

    setState(() {
      _currentIndex = 0;
      _itemCount = 3;
    });

    _onPageChanged = (value) => {
          setState(() {
            _currentIndex = value;
          })
        };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        _buildItem(context, index),
                    itemCount: _itemCount,
                    controller: _controller,
                    pageSnapping: true,
                    onPageChanged: _onPageChanged,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(
                          3,
                          (index) => TabPageSelectorIndicator(
                            backgroundColor: _currentIndex == index
                                ? Colors.red
                                : Colors.grey,
                            borderColor: Colors.white,
                            size: 12,
                          ),
                        )),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "images/" + data[index].imgUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
