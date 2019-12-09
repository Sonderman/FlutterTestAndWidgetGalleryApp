import 'package:flutter/material.dart';

class LoopWidget extends StatefulWidget {
  LoopWidget({Key key}) : super(key: key);

  @override
  _LoopWidgetState createState() => _LoopWidgetState();
}

class _LoopWidgetState extends State<LoopWidget> {
  

  List<Widget> widgets = [];

  void addWidget(){
    widgets.add(Text('Text widget yerine istediğin widget koyabilirsin'));
  }
  void removeLastWidget(){
    widgets.removeLast();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {setState(() {
                addWidget();
              });},
            ),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {setState(() {
                removeLastWidget();
              });},
            )
          ],
        ),
      ),
    );
  }
}
