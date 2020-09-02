

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ourchat/helper/helperfunctions.dart';
import 'package:ourchat/services/auth.dart';
import 'package:ourchat/services/database.dart';
import 'package:ourchat/widgets/widget.dart';

import 'chatRooms.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  bool isLoading = false;
  QuerySnapshot snapshotUserInfo;

  signIn(){
    if (formKey.currentState.validate()){
      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      databaseMethods.getUserByUserEmail(emailTextEditingController.text)
          .then((val){
        snapshotUserInfo = val;
        HelperFunctions
            .saveUserNameSharedPreference(snapshotUserInfo.documents[0].data["name"]);
//        print("${snapshotUserInfo.documents[0].data["name"]} this is not good");
      });

      setState(() {
        isLoading = true;
      });

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
            passwordTextEditingController.text)
          .then((val){
        if(val != null){
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLanguage(context),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox( height: MediaQuery.of(context).size.height * 0.19,),
                Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      validator: (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Beep boop. Please provide a valid email";
                      },
                      controller: emailTextEditingController,
                      style: typedTextStyle(),
                      decoration: textFieldInputDecoration("email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator:  (val){
                        return val.length < 6 ? "Enter Password 6+ characters" : null;
                      },
                      controller: passwordTextEditingController,
                      style: typedTextStyle(),
                      decoration: textFieldInputDecoration("password"),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Forgot Password?",
                      style: typedTextStyle(),
                    ),
                  ),
                ),
                SizedBox( height: 8,),
                GestureDetector(
                  onTap: (){
                    signIn();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFF7E161),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Color(0xFF121313), fontSize: 17),
                    ),
                  ),
                ),
                SizedBox( height: 16,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF6BBF46),
                  ),
                  child: Text(
                    "Sign In with Google",
                    style: TextStyle(color: Color(0xFFF5F5F7), fontSize: 17),
                  ),
                ),
                SizedBox( height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: fractionDisplayTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("Sign Up.", style: linkDisplayTextStyle(),)),
                    )
                  ],
                ),
                SizedBox( height: MediaQuery.of(context).size.height * 0.31,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ourChat from Vincent Maximus", style: smallFractionDisplayTextStyle(),),
                  ],
                ),
                SizedBox( height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
