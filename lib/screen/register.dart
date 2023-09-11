import 'package:flutter/material.dart';
import 'package:to_do_app/data/auth_data.dart';

import '../const/colors.dart';

class register extends StatefulWidget{

  final VoidCallback show;  // VoidCallback is used to pass the function as a parameter
  register(this.show,{super.key}); // this is used to pass the value of the variable to the constructor

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  FocusNode _focusNode1 = FocusNode(); // FocusNode is used to focus the textfield
  FocusNode _focusNode2 = FocusNode(); // FocusNode is used to focus the textfield
  FocusNode _focusNode3 = FocusNode(); // FocusNode is used to focus the textfield
  final email = TextEditingController(); // TextEditingController is used to get the value of the textfield
  final password = TextEditingController(); // TextEditingController is used to get the value of the textfield
  final passwordConfirm = TextEditingController(); // TextEditingController is used to get the value of the textfield

  @override
  void initState() {
    super.initState();  // super is used to call the parent class constructor
    _focusNode1.addListener(() { // addListener is used to listen to the changes in the textfield
      setState(() { // setState is used to update the UI when the value is changed
      });
    });
    super.initState();
    _focusNode2.addListener(() {
      setState(() {

      });
    });
    super.initState();
    _focusNode3.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( // SizedBox widget is used to give spaces between widgets
                height: 20,
              ),
              image(),
              textfield_email(email,_focusNode1,"Email",Icons.email),
              textfield_password(password,_focusNode2,"Password",Icons.lock),
              textfield_passwordConfirm(passwordConfirm,_focusNode3,"Confirm Password",Icons.lock),
              textfield_login(),
              button_register(),
            ],
          ),
        ),
      ),
    );
  }

  Widget image(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/5.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget textfield_email(TextEditingController _controller, FocusNode _focusNode,String typeName,IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,  // TextEditingController is used to get the value of the textfield
          focusNode: _focusNode,  // FocusNode is used to focus the textfield
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration : InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: _focusNode.hasFocus ? custom_green : Color(0xffc5c5c5), // if the textfield is focused the color of the icon will be changed
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield_password(TextEditingController _controller, FocusNode _focusNode,String typeName,IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,  // TextEditingController is used to get the value of the textfield
          focusNode: _focusNode,  // FocusNode is used to focus the textfield
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration : InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: _focusNode.hasFocus ? custom_green : Color(0xffc5c5c5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield_passwordConfirm(TextEditingController _controller, FocusNode _focusNode,String typeName,IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,  // TextEditingController is used to get the value of the textfield
          focusNode: _focusNode,  // FocusNode is used to focus the textfield
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration : InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: _focusNode.hasFocus ? custom_green : Color(0xffc5c5c5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button_register(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 25),
      child: GestureDetector(
        onTap: (){
          AuthenticationRemote().register(email.text, password.text, passwordConfirm.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: custom_green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),

        ),
      ),
    );
  }

  Widget textfield_login(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Do you have an account?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              " Login",
              style: TextStyle(
                color: custom_green,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }




}