import 'package:flutter/material.dart';
import 'package:flutter_system/home.dart';

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
    return Container(
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
                          backgroundColor:
                              _currentIndex == index ? Colors.red : Colors.grey,
                          borderColor: Colors.white,
                          size: 12,
                        ),
                  )),
            ),
          ],
        ));
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/" + data[index].imgUrl),
            fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Visibility(
          visible: _currentIndex == _itemCount - 1 &&
              _controller.page == _itemCount - 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4, right: 14),
            child: RaisedButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              color: Colors.black26,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("启程"),
                  Icon(Icons.chevron_right),
                ],
              ),
              onPressed: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()))
                  },
            ),
          ),
        ),
      ),
    );
  }
}
