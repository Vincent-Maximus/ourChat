import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourchat/helper/authenticate.dart';
import 'package:ourchat/services/auth.dart';
import 'package:ourchat/views/search.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

  AuthMethods authMethods = new AuthMethods();


class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('ourChat',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF121313)))),
        backgroundColor: Color(0xFFF5F5F7),
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Authenticate()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                    Icons.exit_to_app, color: Color(0xFF3854A6))),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => SearchScreen()
          ));
        },
      ),

    );
  }
}
