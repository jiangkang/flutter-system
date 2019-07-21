import 'package:flutter/material.dart';
import 'package:flutter_system/model/model_entry.dart';

final List<EntryItem> pageEntries = [
  EntryItem("Guide Page", "/page/guide"),
];

final List<EntryItem> componentEntries = [
  EntryItem("Show Case 0", "/page/show0", icon: Icons.show_chart),
];

final List<EntryItem> demoEntries = [
  EntryItem("Text", "/demo/text", icon: Icons.text_fields),
  EntryItem("Image", "/demo/image", icon: Icons.image),
  EntryItem("GridView", "/demo/gridview", icon: Icons.grid_on),
];

class PageEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: pageEntries.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(pageEntries[index].routerName);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 28.0, bottom: 28.0, left: 10),
                  child: Text(pageEntries[index].title),
                ),
              ),
            );
          }),
    );
  }
}

class ComponentEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          children: List.generate(componentEntries.length, (index) {
            return Card(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(componentEntries[index].icon),
                    Text(componentEntries[index].title)
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(componentEntries[index].routerName);
                },
              ),
            );
          })),
    );
  }
}

class DemoEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          children: List.generate(demoEntries.length, (index) {
            return Card(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(demoEntries[index].icon),
                    Text(demoEntries[index].title)
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(demoEntries[index].routerName);
                },
              ),
            );
          })),
    );
  }
}

class ArticleEntry extends StatelessWidget {
  final List<String> articles = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(""),
        );
      }),
    );
  }
}
