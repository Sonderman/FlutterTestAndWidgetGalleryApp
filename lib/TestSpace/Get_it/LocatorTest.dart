import 'package:flutter/material.dart';
import 'package:widgettestgallery/TestSpace/Get_it/GetSayacValue.dart';
import 'package:widgettestgallery/locator.dart';

class LocatorTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int sayi = locator<GetSayac>().sayac;

    return Container(
      child: Scaffold(
        body: Center(child: Text('$sayi')),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                locator<GetSayac>().arttir();
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
