import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  NoteType currentType = NoteType.TODO;

  final Map<NoteType, List<Note>> notesMap = {
    NoteType.TODO: [],
    NoteType.DOING: [],
    NoteType.DONE: []
  };

  final tabs = <Tab>[
    Tab(
      text: "To DO",
    ),
    Tab(
      text: "Doing",
    ),
    Tab(
      text: "Done",
    ),
  ];

  @override
  void initState() {
    notesMap[NoteType.TODO]?.add(Note("这里是待办事项", NoteType.TODO));
    notesMap[NoteType.DOING]?.add(Note("这里是正在做的任务", NoteType.DOING));
    notesMap[NoteType.DONE]?.add(Note("这里是完成的任务", NoteType.DONE));
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
        bottom: TabBar(
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabView(NoteType.TODO),
          _buildTabView(NoteType.DOING),
          _buildTabView(NoteType.DONE),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '新增记录',
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            int index = _tabController.index;
            switch (index) {
              case 0:
                currentType = NoteType.TODO;
                break;
              case 1:
                currentType = NoteType.DOING;
                break;
              case 2:
                currentType = NoteType.DONE;
                break;
            }
            notesMap[currentType]?.add(Note("测试一下", currentType));
          });
        },
      ),
    );
  }

  Widget _buildTabView(NoteType noteType) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(notesMap[noteType]![index].content),
      ),
      itemCount: notesMap[noteType]!.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class Note {
  final String content;

  final NoteType noteType;

  Note(this.content, this.noteType);
}

enum NoteType { TODO, DOING, DONE }
