import 'package:flutter/material.dart';

import '../screen/login.dart';
import '../screen/register.dart';

class auth_page extends StatefulWidget {
  const auth_page({super.key});

  @override
  State<auth_page> createState() => _auth_pageState();
}

class _auth_pageState extends State<auth_page> {

  bool auth = true;

  void to(){  // this function is used to change the state of the page
    setState(() {
      auth =! auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(auth){
      return login(to);
    }else{
      return register(to);
    }
  }
}



