import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RepeatThis();
  }
}

class RepeatThis extends State<Splash> {
  List<Widget> widgets = [];
  ///Değişiklik burada////
  int itemcount(){
    return widgets.length;
  }
  void addwidget() {
    widgets.add(
      ListTile(
        title: Text("Workout GYM"),
        subtitle: Text("10:10"),
        trailing: Icon(Icons.alarm),
      ),
    );
  }
///Değişiklik burada////
  Widget returnwidget( int index) {
    return widgets[index];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'iSmart',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
              onPressed: () {
                print('Click start');
              },
            ),
          ],
        ),
        ///Değişiklik burada////
        body: ListView.builder(
          itemCount: itemcount(),
          itemBuilder: (BuildContext context,index){
            return returnwidget(index);
          }
        ),
        
        floatingActionButton: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(150),
                  ),
                  child: Container(
                    color: Colors.grey.shade100,
                    width: 200,
                    height: 150,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: RaisedButton(
                    color: Colors.white,
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      setState(() {
                        addwidget();
                      });
//-------------------------------------------------------------//
                    },
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}