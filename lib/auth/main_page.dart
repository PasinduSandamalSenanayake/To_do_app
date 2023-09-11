import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth/auth_page.dart';
import 'package:to_do_app/screen/home.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),builder: (context,snapshot){
        if(snapshot.hasData){
          return home();
        }else{
          return auth_page();
        }
      },),
    );
  }
}
