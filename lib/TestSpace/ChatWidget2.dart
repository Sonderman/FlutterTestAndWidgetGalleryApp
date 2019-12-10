import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class ChatWidget2 extends StatefulWidget {
  ChatWidget2({Key key}) : super(key: key);

  @override
  _ChatWidget2State createState() => _ChatWidget2State();
}

class _ChatWidget2State extends State<ChatWidget2> {
  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    return Scaffold(
      body: Container(
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Bubble(
              alignment: Alignment.center,
              color: Color.fromARGB(255, 212, 234, 244),
              elevation: 1 * px,
              margin: BubbleEdges.only(top: 8.0),
              child: Text('TODAY', style: TextStyle(fontSize: 10)),
            ),
            Bubble(
              style: styleSomebody,
              child: Text(
                  'Hi Jason. Sorry to bother you. I have a queston for you.'),
            ),
            Bubble(
              style: styleMe,
              child: Text('Whats\'up?'),
            ),
            Bubble(
              style: styleSomebody,
              child: Text('I\'ve been having a problem with my computer.'),
            ),
            Bubble(
              style: styleSomebody,
              margin: BubbleEdges.only(top: 2.0),
              nip: BubbleNip.no,
              child: Text('Can you help me?'),
            ),
            Bubble(
              style: styleMe,
              child: Text('Ok'),
            ),
            Bubble(
              style: styleMe,
              nip: BubbleNip.no,
              margin: BubbleEdges.only(top: 2.0),
              child: Text('What\'s the problem?'),
            ),
          ],
        ),
      ),
    );
  }
}
