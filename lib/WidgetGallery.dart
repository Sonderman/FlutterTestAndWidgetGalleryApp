import 'package:flutter/material.dart';
import 'package:widgetgallerytest/TestSpace/ApiCommunication/ApiCommunication.dart';
import 'package:widgetgallerytest/TestSpace/ChatWidget.dart';
import 'package:widgetgallerytest/TestSpace/WebView/ExampleWebView.dart';
import 'package:widgetgallerytest/TestSpace/WebView/WebView.dart';

class WidgetGallery extends StatelessWidget {
  const WidgetGallery({Key key}) : super(key: key);

  void goToPage(BuildContext context, Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MaterialButton(
                  color: Colors.blue,
                  child: Text("ChatWidget1"),
                  onPressed: () {
                    goToPage(context, ChatPage());
                  },
                ),
                MaterialButton(
                  color: Colors.green,
                  child: Text("ApiCommunication"),
                  onPressed: () {
                    goToPage(context, ApiCommunication());
                  },
                ),
                MaterialButton(
                  color: Colors.green,
                  child: Text("WebView"),
                  onPressed: () {
                    goToPage(context, WebViewPage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
