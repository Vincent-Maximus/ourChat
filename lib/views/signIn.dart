

import 'package:flutter/material.dart';
import 'package:ourchat/widgets/widget.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                TextField(
                  style: typedTextStyle(),
                  decoration: textFieldInputDecoration("email"),
                ),
                TextField(
                  style: typedTextStyle(),
                  decoration: textFieldInputDecoration("password"),
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
                Container(
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
