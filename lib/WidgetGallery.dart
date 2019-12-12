import 'package:flutter/material.dart';
import 'package:widgetgallerytest/TestSpace/ChatWidget.dart';


class WidgetGallery extends StatelessWidget {
  const WidgetGallery({Key key}) : super(key: key);

  void goToPage(BuildContext context, var page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    ChatPage chatPage = ChatPage();
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MaterialButton(
                  child: Text("ChatWidget1"),
                  onPressed: () {
                    goToPage(context, chatPage);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
