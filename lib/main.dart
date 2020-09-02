import 'package:flutter/material.dart';
import 'package:ourchat/helper/authenticate.dart';
import 'package:ourchat/helper/helperfunctions.dart';
import 'package:ourchat/views/chatRooms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async{
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F7),
        primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn ?  ChatRoom() : Authenticate(),
    );
  }
}

class WaitingRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
