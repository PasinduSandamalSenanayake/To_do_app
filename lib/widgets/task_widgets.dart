import 'package:flutter/material.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/model/notes_model.dart';
import 'package:to_do_app/screen/edit_screen.dart';

import '../data/firestore.dart';

class task_Widget extends StatefulWidget {
  Note _note;
  task_Widget(this._note,{super.key});

  @override
  State<task_Widget> createState() => _task_WidgetState();
}

//bool isDone = false;


class _task_WidgetState extends State<task_Widget> {


  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 8,
                  offset: Offset(0,2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  image(),
                  title(),
                ],
              ),
            ),
          ),
        );
  }

  Widget image() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/${widget._note.image}.png'),
        ),
      ),
    );
  }

  Widget title(){
    bool isDone = widget._note.isDon;
    return Expanded( //Expanded is used to make the widget take the remaining space
      child: Container(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                  widget._note.title, // 'title'
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDone ? custom_green : Colors.black,
                ),
                ),
                  Checkbox(
                      value: isDone,
                      onChanged:(value){
                        setState(() {
                          isDone =!isDone;
                        });
                        Firestore_Datasource().isDone(widget._note.id, isDone);
                        },
                      activeColor: custom_green,
                      checkColor: Colors.white,

                  ),
                ],
              ),
              Text(
                  widget._note.subtitle, // 'subtitle'
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isDone ? Colors.black : Colors.grey.shade400,
              )
              ),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        color: custom_green,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Row(
                         children: [
                           Image.asset("images/icon_time.png"),
                         SizedBox(width: 8),
                         Text(
                           widget._note.time, // 'time'
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           color: Colors.white,
                         ),
                         ),
                          //SizedBox(width: 5),
                        ],
                     ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=> Edit_screen(widget._note),
                            ),
                        );
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          child: Row(
                            children: [
                              Image.asset("images/icon_edit.png"),
                              SizedBox(width: 8),
                              Text("Edit",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              //SizedBox(width: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

