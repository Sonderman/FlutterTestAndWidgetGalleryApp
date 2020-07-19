import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:widgetgallerytest/TestSpace/ApiCommunication/ApiModel.dart';

class ApiCommunication extends StatefulWidget {
  ApiCommunication({Key key}) : super(key: key);

  @override
  _ApiCommunicationState createState() => _ApiCommunicationState();
}

class _ApiCommunicationState extends State<ApiCommunication> {
  Future<List<JsonModel>> getData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      var jsonResponseList = convert.jsonDecode(response.body) as List;
      var modelList = jsonResponseList.map((e) => JsonModel.fromMap(e));
      modelList.forEach((model) {
        print("id:" + model.id.toString() + "Title:" + model.title);
      });
      return modelList.toList();
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: FutureBuilder(
                future: getData(),
                builder: (_, AsyncSnapshot<List<JsonModel>> snap) {
                  if (snap.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snap.data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(snap.data[index].title),
                          subtitle: Text(snap.data[index].body),
                          leading: CircleAvatar(
                            child: Text(snap.data[index].id.toString()),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
      ),
    );
  }
}
