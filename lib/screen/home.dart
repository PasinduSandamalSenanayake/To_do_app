import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/data/firestore.dart';

import '../widgets/task_widgets.dart';
import 'add_note_screen.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //final Firestore_Datasource firestoreDatasource = Firestore_Datasource(); //new
  @override
  bool floatingActionBtnShow = true;
  Widget build(BuildContext context) {
    return Scaffold(
          //backgroundColor: backgroundColor,
          floatingActionButton: Visibility(
            visible: floatingActionBtnShow,
            child: FloatingActionButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=>Add_screen(),
                    ),
                );
              },
              backgroundColor: custom_green,
              child: Icon(Icons.add,size: 30,),
            ),
          ),

          appBar: AppBar(
            backgroundColor: custom_green,
            elevation: 5.5,
            title: Text(
              'To Do App',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            // if forward scroll then show the floating action button. If reverse scroll then hide the floating action button
            child: NotificationListener<UserScrollNotification>( //UserScrollNotification is used to detect the scroll direction
              onNotification: (notification){ //onNotification is used to detect the scroll direction
                if(notification.direction == ScrollDirection.forward) { //ScrollDirection.forward is used to detect the scroll direction
                  setState(() {
                    floatingActionBtnShow = true;
                  });
                }if(notification.direction == ScrollDirection.reverse) {
                  setState(() {
                    floatingActionBtnShow = false;
                  });
                }
                return true;
              },

              child: StreamBuilder<QuerySnapshot>( // StreamBuilder is used to get the data from the firestore
                stream: Firestore_Datasource().stream(), // stream is used to get the data from the firestore

                builder: (context, snapshot) {
                  if(!snapshot.hasData){ // if there is no data then show the circular progress indicator
                    //print('No data available'); //error
                    return CircularProgressIndicator();
                  }
                  final notesList = Firestore_Datasource().getNote(snapshot); // getNotes is used to get the data from the firestore
                  //final notesList = firestoreDatasource.getNote(snapshot);
                  //final notesListLength = notesList.length;
                  //print('Notes List: $notesListLength'); // error
                  return ListView.builder(
                      itemBuilder: (context,index){
                        final note = notesList[index];
                        return Dismissible( // Dismissible is used to delete the data from the firestore
                            key: UniqueKey(), // UniqueKey is used to delete the data from the firestore
                            onDismissed: (Direction){
                              Firestore_Datasource().delete_note(note.id);
                            },
                            child :task_Widget(note));
                      },
                    itemCount: notesList.length,
                  );
                }
              ),
            ),
          ),
      );
  }
}