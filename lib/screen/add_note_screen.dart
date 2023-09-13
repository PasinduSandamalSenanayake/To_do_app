import 'package:flutter/material.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/data/firestore.dart';

class Add_screen extends StatefulWidget {
  const Add_screen({super.key});

  @override
  State<Add_screen> createState() => _Add_screenState();
}

class _Add_screenState extends State<Add_screen> {

  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: custom_green,
        title: Text('Add Note'),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title_widget(),
            subtitle_widget(),
            SizedBox(height: 10,),
            imageSet_widget(),
            SizedBox(height: 20,),
            button_widget(),
          ],
        ),
      ),
    );
  }

  Widget title_widget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: title,  // TextEditingController is used to get the value of the textfield
          focusNode: _focusNode1,  // FocusNode is used to focus the textfield
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration : InputDecoration(

            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'Title',
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

  Widget subtitle_widget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,  // TextEditingController is used to get the value of the textfield
          focusNode: _focusNode2,  // FocusNode is used to focus the textfield
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration : InputDecoration(

            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'Subtitle',
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

  Widget imageSet_widget(){
    return Container(
      height: 170,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              setState(() {
                indexx = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: indexx == index ? custom_green : Colors.grey,
                ),
              ),
              width: 140,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset('images/${index}.png'),
                ],
              ),
            ),
          );
        },

      ),
    );
  }

  Widget button_widget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, // To make the buttons in the center
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: custom_green,
            minimumSize: Size(150, 50),
          ),
            onPressed: (){
            Firestore_Datasource().addNote(subtitle.text, title.text, indexx);
            Navigator.pop(context);
            },
            child: Text(
                'Add task',
            ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            minimumSize: Size(150, 50),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
          ),
        ),
      ],
    );
  }
}
