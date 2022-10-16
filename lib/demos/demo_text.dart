import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Text Demos
class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Demo"),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(child: Text("源码"))),
            onTap: () {
              launchUrl(
                Uri.parse(
                    "https://github.com/jiangkang/flutter-system/blob/master/lib/demos/demo_text.dart"),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // default
          ListTile(
            title: InkWell(
              child: Text(
                "Default Text",
              ),
              onTap: () {
                debugPrint("click");
              },
            ),
          ),
          ListTile(
            title: Text(
              "方正仿宋-简体",
              style: TextStyle(fontFamily: "FangZhengFangSongJianTi"),
            ),
          ),
          //text align
          ListTile(
            title: Text(
              "textAlign:TextAlign.center",
              textAlign: TextAlign.center,
            ),
          ),
          //text direction
          ListTile(
            title: Text(
              "textDirection: TextDirection.rtl",
              textDirection: TextDirection.rtl,
            ),
          ),
          ListTile(
            title: Text(
              "textScaleFactor: 1.5",
              textScaleFactor: 1.5,
            ),
          ),
          ListTile(
            title: Text(
              "softWrap: false;softWrap: false;softWrap: false;softWrap: false;softWrap: false;softWrap: false;",
              softWrap: false,
            ),
          ),
          ListTile(
            title: Text(
              "softWrap: true;softWrap: true;softWrap: true;softWrap: true;softWrap: true;",
              softWrap: true,
            ),
          ),
          ListTile(
            title: Text(
              "overflow: TextOverflow.ellipsis;overflow: TextOverflow.ellipsis;overflow: TextOverflow.ellipsis;",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          ListTile(
            title: Text(
              "overflow: TextOverflow.clip;overflow: TextOverflow.clip;overflow: TextOverflow.clip;",
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          ),
          ListTile(
            title: Text(
              "overflow: TextOverflow.fade,overflow: TextOverflow.fade,overflow: TextOverflow.fade,overflow: TextOverflow.fade,",
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
          ListTile(
            title: Text("style: color,fontWeight,fontSize,fontStyle",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                )),
          ),
          ListTile(
            title: Text(
              "style: letterSpacing,shadows",
              style: TextStyle(
                shadows: const <Shadow>[
                  Shadow(color: Colors.pink, offset: Offset(1, 2))
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "decoration",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blueAccent,
                  decorationStyle: TextDecorationStyle.solid),
            ),
          ),
          ListTile(
            title: Text(
              "decoration",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blueAccent,
                  decorationStyle: TextDecorationStyle.wavy),
            ),
          ),
          ListTile(
            title: Text(
              "decoration: TextDecoration.lineThrough",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.dotted),
            ),
          ),
          ListTile(
            title: Text(
              "decoration: TextDecoration.overline",
              style: TextStyle(
                  decoration: TextDecoration.overline,
                  decorationStyle: TextDecorationStyle.double),
            ),
          ),
          ListTile(
            title: Text(
              "decoration: overline & underline",
              style: TextStyle(
                decoration: TextDecoration.combine(<TextDecoration>[
                  TextDecoration.underline,
                  TextDecoration.overline
                ]),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "decoration: TextDecoration.combine",
              style: TextStyle(
                  decoration: TextDecoration.combine(<TextDecoration>[
                    TextDecoration.lineThrough,
                    TextDecoration.underline
                  ]),
                  decorationStyle: TextDecorationStyle.wavy),
            ),
          ),
          ListTile(
            title: Text.rich(
              TextSpan(
                text: "plain text ",
                children: const <TextSpan>[
                  TextSpan(
                      text: "color",
                      style: TextStyle(color: Colors.pinkAccent)),
                  TextSpan(text: "fontSize", style: TextStyle(fontSize: 28)),
                  TextSpan(
                      text: "decoration",
                      style: TextStyle(decoration: TextDecoration.lineThrough)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
                text: TextSpan(
              children: const <InlineSpan>[
                TextSpan(
                    text: "Text 1", style: TextStyle(color: Colors.blueAccent)),
                TextSpan(
                    text: "Text 2",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 28)),
                WidgetSpan(
                    child: Icon(
                  Icons.ac_unit,
                  size: 28,
                )),
              ],
            )),
          )
        ],
      ),
    );
  }
}
