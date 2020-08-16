import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourchat/services/database.dart';
import 'package:ourchat/widgets/widget.dart';

import 'chatRooms.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //cleartext controller

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch(){
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
        .then((val){
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList(){
    print("testtje");
    print( searchSnapshot.documents);

    return searchSnapshot != null? ListView.builder(
        itemCount: searchSnapshot.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
          return SearchTitle(
            userName: searchSnapshot.documents[index].data["name"],
            userEmail: searchSnapshot.documents[index].data["email"],
          );
          }) : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: appBarMain(context),
      body: Container(
        child:  Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: EdgeInsets.only(top: 35),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 15,right: 5),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFE7E7E7),
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.0) //         <--- border radius here
                        ),
                      ),
                      child: TextField(
                          controller: searchTextEditingController,
                          style: typedTextStyle(),
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Color(0xFFC4C4C4)),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Color(0xFF888888)),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () => searchTextEditingController.clear(),
                              icon: Icon(Icons.cancel,
                                  size: 22, color: Color(0xFFC4C4C4)),
                            ),
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                    },
                    child: Container(
//                      color: Color(0xFF3854A6),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "SearchBtn",
                        style: displayTextStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatRoom()));
                      },
                      child: Text(
                        "Cancel",
                        style: displayTextStyle(),
                      )
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTitle extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTitle({this.userName, this.userEmail});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: displayTextStyle(),),
              Text(userEmail, style: displayTextStyle(),)
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7E161),
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message",style: displayTextStyle(),),
          ),
        ],
      ),
    );
  }
}
