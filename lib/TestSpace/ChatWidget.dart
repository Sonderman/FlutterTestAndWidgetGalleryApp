import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  List<ChatMessage> messages = List<ChatMessage>();
  var m = List<ChatMessage>();
  var scrollController = ScrollController();
  String chatID;
  String user1 = 'aaaaaaaa1111';
  String user2 = 'aaaaaaaa2222';
  var i = 0;

  ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123klg789",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  Future onSend(ChatMessage message) async {
    if (chatID == "temp") {
      chatID = "generatedID";

      await Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
            Firestore.instance
                .collection('users')
                .document(user1)
                .collection('messages')
                .document(chatID),
            {"OtherUserID": user2});
        await transaction.set(
            Firestore.instance
                .collection('users')
                .document(user2)
                .collection('messages')
                .document(chatID),
            {"OtherUserID": user1});
      });
    }
    var messageRef = Firestore.instance
        .collection('messagePool')
        .document(chatID)
        .collection('messages')
        .document(DateTime.now().millisecondsSinceEpoch.toString());
    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        messageRef,
        message.toJson(),
      );
    }, timeout: Duration(seconds: 1));
  }

  Future<String> checkConversation() async {
    try {
      return await Firestore.instance
          .collection('users')
          .document(user1)
          .collection('messages')
          .where("OtherUserID", isEqualTo: user2)
          .limit(1)
          .getDocuments()
          .then((data) {
        return data.documents.first.documentID;
      });
    } catch (e) {
      print(e);
      return "bos";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: FutureBuilder(
        future: checkConversation(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError &&
                snapshot.hasData &&
                snapshot.data != "bos")
              chatID = snapshot.data;
            else
              chatID = "temp";
            print("ChatID:" + chatID);
            return StreamBuilder(
                stream: Firestore.instance
                    .collection('messagePool')
                    .document(chatID)
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  } else {
                    List<DocumentSnapshot> items = snapshot.data.documents;
                    var messages =
                        items.map((i) => ChatMessage.fromJson(i.data)).toList();
                    return SingleChildScrollView(
                      child: DashChat(
                        key: _chatViewKey,
                        inverted: false,
                        onSend: (ChatMessage message) {
                          onSend(message).whenComplete(() {
                            setState(() {});
                          });
                        },
                        user: user,
                        scrollController: scrollController,
                        onLoadEarlier: () {},
                        inputDecoration: InputDecoration.collapsed(
                            hintText: "Mesaj gönderin"),
                        dateFormat: DateFormat('yyyy-MMM-dd'),
                        timeFormat: DateFormat('HH:mm'),
                        messages: messages,
                        showUserAvatar: false,
                        showAvatarForEveryMessage: false,

                        //scrollToBottom: false,
                        onPressAvatar: (ChatUser user) {
                          print("OnPressAvatar: ${user.name}");
                        },
                        onLongPressAvatar: (ChatUser user) {
                          print("OnLongPressAvatar: ${user.name}");
                        },
                        inputMaxLines: 5,
                        messageContainerPadding:
                            EdgeInsets.only(left: 5.0, right: 5.0),
                        alwaysShowSend: false,
                        inputTextStyle: TextStyle(fontSize: 16.0),
                        inputContainerStyle: BoxDecoration(
                          border: Border.all(width: 0.0),
                          color: Colors.white,
                        ),
                        shouldShowLoadEarlier: false,
                        showTraillingBeforeSend: true,
                        trailing: <Widget>[
                          IconButton(
                            icon: Icon(Icons.photo),
                            onPressed: () async {
                              File result = await ImagePicker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 100,
                                maxHeight: 400,
                                maxWidth: 400,
                              );

                              if (result != null) {
                                String time = DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString();
                                final StorageReference storageRef =
                                    FirebaseStorage.instance
                                        .ref()
                                        .child("users")
                                        .child(user1)
                                        .child("images")
                                        .child(time);

                                StorageUploadTask uploadTask =
                                    storageRef.putFile(
                                  result,
                                  StorageMetadata(
                                    contentType: 'image/jpg',
                                  ),
                                );
                                StorageTaskSnapshot download =
                                    await uploadTask.onComplete;

                                String url =
                                    await download.ref.getDownloadURL();

                                ChatMessage message = ChatMessage(
                                    text: "", user: user, image: url);

                                var messageRef = Firestore.instance
                                    .collection('messagePool')
                                    .document(chatID)
                                    .collection('messages')
                                    .document(time);

                                Firestore.instance
                                    .runTransaction((transaction) async {
                                  await transaction.set(
                                    messageRef,
                                    message.toJson(),
                                  );
                                });
                              }
                            },
                          )
                        ],
                      ),
                    );
                  }
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
