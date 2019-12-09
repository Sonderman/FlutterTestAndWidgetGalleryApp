import 'package:flutter/material.dart';

class Login1 extends StatelessWidget {
  @override
     Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Center(
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "Username or Email",
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(30.0),
                            //elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () => {},
                              minWidth: 150.0,
                              height: 50.0,
                              color: Color(0xFF179CDF),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Don't Have a Account?")),
                    Text("Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            32.0,
                          ),
                          side: BorderSide(color: Color(0xFF179CDF))),
                      child: Text(
                        "SKIP SIGN UP FOR NOW",
                        style:
                        TextStyle(fontSize: 18.0, color: Color(0xFF179CDF)),
                      ),
                    )),
              ],
            ),
          ),
        );
      }
    }