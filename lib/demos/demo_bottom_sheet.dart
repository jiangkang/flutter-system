import 'package:flutter/material.dart';

import 'demos.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runDemo(BottomSheetDemo());
}

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => FullScreenPage(),
              barrierColor: Colors.transparent,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ).then((value) {});
          },
          child: Text("showModalBottomSheet"),
        ),
      ),
    );
  }
}

class FullScreenPage extends StatelessWidget {
  const FullScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.redAccent,
      ),
      child: AnimatedPadding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        duration: Duration(milliseconds: 500),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 48,
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: Icon(Icons.close),),
            ),
            Expanded(
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                  )
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: const [
                  Icon(Icons.emoji_emotions_outlined),
                  Icon(Icons.emoji_emotions_outlined),
                  Icon(Icons.emoji_emotions_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
