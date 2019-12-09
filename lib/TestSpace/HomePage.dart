import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                child: FlatButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage2()));
                  },
                  child: Text("Test1"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
