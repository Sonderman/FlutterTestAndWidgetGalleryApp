import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgettestgallery/TestSpace/Provider/SayacProvider.dart';

class Sayac extends StatelessWidget {
  const Sayac({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sayac = Provider.of<SayacProvider>(context);

    return Container(
      child: Scaffold(
        body: Center(child: Text('${sayac.sayi}')),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                sayac.arttir();
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                sayac.azalt();
              },
            )
          ],
        ),
      ),
    );
  }
}
