//import 'dart:html';

import 'package:flutter/material.dart';

class LoginPAge extends StatefulWidget {
  @override
  _LoginPAgeState createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPAge> {
  @override
  Widget build(BuildContext context) {

    final logo = Center(
     
        child:Image.asset('assets/LOGO-UTM.png'),
      
      );


      final username = TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        //initialValue: 'thebrainiacs98',
        decoration: InputDecoration(
          hintText: 'UTMID',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

      final password =  TextFormField(
        autofocus: false,
       // initialValue: 'some password',
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

      final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.redAccent.shade100,
          elevation: 5.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed: (){},
            color: Colors.redAccent,
            child: Text('Log In x', style: TextStyle(color: Colors.white)),
            ),
          ),
        );

        final forgetLabel = FlatButton(
            onPressed: null,
           child: Text('Forgot Password?', style: TextStyle(color: Colors.black54)
           )
           );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:ListView(
          shrinkWrap:true,
          padding: EdgeInsets.only(left: 24 , right: 24),
          children: <Widget>[
            logo, 
            SizedBox(height: 48,),
            username,
            SizedBox(height: 8,),
            password,
            SizedBox(height: 24,),
            loginButton,
            //SizedBox(height: 3,),
            forgetLabel,


          ],

        ),
        ),
      
    );
  }
}