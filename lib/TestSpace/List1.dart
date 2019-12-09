import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  @override
  State<AppHome> createState() {
    return new AppState();
  }
}

class AppState extends State<AppHome> {
  List<String> names = [
    'Abhishek',
    'John',
    'Robert',
    'Shyam',
    'Sita',
    'Gita',
    'Nitish'
  ];
  List<String> content = [
    'Abhishek content',
    'John content',
    'Robert content',
    'Shyam content',
    'Sita content',
    'Gita content',
    'Nitish content'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("My List App"),
      ),
      body: new Container(
        child: new ListView.builder(
          reverse: false,
          itemBuilder: (_, int index) =>
              EachList(this.names[index], content[index]),
          itemCount: this.names.length,
        ),
      ),
    );
  }
}

class EachList extends StatelessWidget {
  final String content;
  final String name;
  EachList(this.name, this.content);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ContentView(
                    content: content,
                  )),
        );
      },
      child: new Card(
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                child: new Text(name[0]),
              ),
              new Padding(padding: EdgeInsets.only(right: 10.0)),
              new Text(
                name,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContentView extends StatelessWidget {
  const ContentView({Key key, this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seçilen öğenin içeriği"),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
