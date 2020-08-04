import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          onWebViewCreated: (c) {
            controller = c;
          },
          initialUrl: "https://flutter.dev",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: false,
        ),
      ),
    );
  }
}
