import 'package:flutter/material.dart';

/// Text Demos
class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Default Text",
          ),
        ),
        ListTile(
          title: Text(
            "textAlign:TextAlign.center",
            textAlign: TextAlign.center,
          ),
        ),
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
              letterSpacing: 4,
              shadows: <Shadow>[
                Shadow(color: Colors.pink, offset: Offset(1, 2))
              ],
            ),
          ),
        ),
        ListTile(
          title: Text(
            "decoration: underline,decorationColor,decorationStyle: TextDecorationStyle.dashed",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blueAccent,
                decorationStyle: TextDecorationStyle.dashed),
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
              children: <TextSpan>[
                TextSpan(
                    text: "color", style: TextStyle(color: Colors.pinkAccent)),
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
            children: <TextSpan>[
              TextSpan(
                  text: "Text 1", style: TextStyle(color: Colors.blueAccent)),
              TextSpan(
                  text: "Text 2",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 28)),
            ],
          )),
        )
      ],
    );
  }
}
