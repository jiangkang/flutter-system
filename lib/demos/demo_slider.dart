import 'package:flutter/material.dart';
import 'package:flutter_system/utils/ui_utils.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SlideDemoState createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SliderDemo> {
  double _value1 = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Builder(
              builder: (BuildContext context) => Slider(
                min: 0,
                value: _value1,
                max: 100,
                onChanged: (progress) {
                  setState(() {
                    _value1 = progress;
                  });
                },
                onChangeStart: (progress) {
                  showSnackBar(context, "drag start");
                },
                onChangeEnd: (progress) {
                  showSnackBar(context, "drag end");
                },
                activeColor: Colors.redAccent,
                inactiveColor: Colors.blueAccent,
                label: _value1.toString(),
                divisions: 3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Slider(
              min: 0,
              value: _value1,
              max: 100,
              onChanged: (progress) {
                setState(() {
                  _value1 = progress;
                });
              },
              activeColor: Colors.redAccent,
              inactiveColor: Colors.blueAccent,
              label: "score",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Slider(
              min: 0,
              value: 30,
              max: 100,
              onChanged: null,
              activeColor: Colors.redAccent,
              inactiveColor: Colors.blueAccent,
              label: "score",
              divisions: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 6,
                activeTickMarkColor: Colors.purple,
                activeTrackColor: Colors.pinkAccent,
                inactiveTrackColor: Colors.blueAccent,
                trackShape: RoundedRectSliderTrackShape(),
              ),
              child: Slider(
                value: 30,
                min: 0,
                max: 100,
                onChanged: (progress) {},
                divisions: 10,
              ),
            ),
          ),
          RangeSlider(
            values: RangeValues(20, 60),
            min: 0,
            max: 100,
            onChanged: (range) {},
            activeColor: Colors.redAccent,
            inactiveColor: Colors.blueAccent,
            divisions: 5,
            labels: RangeLabels("Start", "End"),
          ),
        ],
      ),
    );
  }
}
