

import 'package:flutter/material.dart';
import 'package:ourchat/helper/helperfunctions.dart';
import 'package:ourchat/services/database.dart';
import 'package:ourchat/views/chatRooms.dart';
import 'package:ourchat/services/auth.dart';
import 'package:ourchat/widgets/widget.dart';


class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}




class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  HelperFunctions helperFunctions = new HelperFunctions();


  final formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();



  signUserUp() {

    if(formKey.currentState.validate()){

      Map<String, String> userInfoMap = {
        "name": nameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);
      HelperFunctions.saveUserNameSharedPreference(nameTextEditingController.text);


      setState(() {
        isLoading = true;
      });

      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
          passwordTextEditingController.text).then((val){
//            print("$val.${val.uid}");

        databaseMethods.uploadUserInfo(userInfoMap);
        HelperFunctions.saveUserLoggedInSharedPreference(true);
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => ChatRoom()
            ));
          });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLanguage(context),
      body: isLoading ? Container(
        child: Center(
            child: CircularProgressIndicator()),
      ) : SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox( height: MediaQuery.of(context).size.height * 0.13,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2 ? "Beep boop. Please provide a valid name" : null;
                        },
                        controller: nameTextEditingController,
                        style: typedTextStyle(),
                        decoration: textFieldInputDecoration("Name"),
                      ),
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Beep boop. Please provide a valid email";
                        },
                        controller: emailTextEditingController,
                        style: typedTextStyle(),
                        decoration: textFieldInputDecoration("Email"),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator:  (val){
                          return val.length < 6 ? "Enter Password 6+ characters" : null;
                        },
                        controller: passwordTextEditingController,
                        style: typedTextStyle(),
                        decoration: textFieldInputDecoration("Password"),
                      ),
                    ],
                  ),
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
                    signUserUp();
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
                      "Sign Up",
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
                    "Sign Up with Google",
                    style: TextStyle(color: Color(0xFFF5F5F7), fontSize: 17),
                  ),
                ),
                SizedBox( height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: fractionDisplayTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("Sign In.", style: linkDisplayTextStyle(),)),
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
