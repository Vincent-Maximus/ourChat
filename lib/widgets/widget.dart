import 'package:flutter/material.dart';



Widget appBarMain(BuildContext context){
  return AppBar(
    title: Center(child: Text('ourChat', textAlign: TextAlign.center,  style: TextStyle(color: Color(0xFF121313)))),
    backgroundColor: Color(0xFFF5F5F7)
  );
}


Widget appBarLanguage(BuildContext context){
  return AppBar(

    title: Center(child: Text('English (United States)', textAlign: TextAlign.center,  style: smallFractionDisplayTextStyle())),
    backgroundColor: Color(0xFFF5F5F7)
  );
}


InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          color: Color(0xFF888888)
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF3854A6))
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF888888))
      )
  );
}


TextStyle typedTextStyle(){
  return TextStyle(
      color: Color(0xFF121313)
  );
}


TextStyle displayTextStyle() {
  return TextStyle(
    color: Color(0xFF121313),
    fontSize: 17,
  );
}

TextStyle fractionDisplayTextStyle() {
  return TextStyle(
    color: Color(0xFF888888),
    fontSize: 17,
  );
}

TextStyle smallFractionDisplayTextStyle() {
  return TextStyle(
    color: Color(0xFF888888),
    fontSize: 14,
  );
}

TextStyle linkDisplayTextStyle() {
  return TextStyle(
    color: Color(0xFF121313),
    fontSize: 17,
    decoration: TextDecoration.underline
  );
}