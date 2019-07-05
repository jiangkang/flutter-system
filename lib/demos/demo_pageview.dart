import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.pink,
  Colors.pinkAccent,
  Colors.redAccent,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.purple
];

class PageViewDemo extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView Demo"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 150,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    PageView.builder(
                      itemBuilder: (context, index) => Container(
                            width: 300,
                            height: 300,
                            color: colors[index % colors.length],
                          ),
                      pageSnapping: true,
                      controller: _controller,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Icon(
                            Icons.chevron_left,
                            size: 32,
                          ),
                          onTap: () => _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.chevron_right,
                            size: 32,
                          ),
                          onTap: () => _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: PageViewDemo(),
    ));
