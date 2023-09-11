import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../model/notes_model.dart';

class Firestore_Datasource{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUser(String email) async {  // this function is used to create a new user in the database
    try{
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({ // this line is used to create a new document in the collection users with the id of the user
        "id": _auth.currentUser!.uid, "email" : email  // this line is used to add the id and the email of the user in the document
      });
      return true;  // this line is used to return true if the user is created
    }catch(e){
      return true;
    }
  }

  Future<bool> addNote(String subtitle, String title, int image) async {
    var uuid = Uuid().v4();
    DateTime dateTime = new DateTime.now();
    try{
      await _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': uuid,
        'subtitle': subtitle,
        'isDon' : false, // this line is used to add the isDon field in the document // this field is used to know if the task is done or not
        'image' : image,
        'time' : '${dateTime.hour}:${dateTime.minute}', //dateTime
        'title' : title,
      });
      return true;
    }catch(e){
      return true;
    }
  }

  List getNote(AsyncSnapshot snapshot){ // this function is used to get the data from the database
    try{
      final notesList = snapshot.data.docs.map((doc){
        final data = doc.data() as Map<String, dynamic>; // this line is used to get the data from the database as a map
        return Note( // this line is used to return the data from the database as a list of Note
          data['id'],
          data['subtitle'],
          data['time'],
          data['image'],
          data['title'],
          data['isDon'],
        );
      }).toList();
      return notesList;
    }catch(e){
      //print('Error getting notes: $e'); //error
      return [];
    }
  }

  // Stream<QuerySnapshot> stream(){         // this function is used to get the data from the database as a stream
  //   return _firestore.collection('users')
  //       .doc(_auth.currentUser!.uid)
  //       .collection('notes')
  //       .snapshots();
  // }

  Stream<QuerySnapshot> stream(){
    if (_auth.currentUser != null) {
      return _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .snapshots();
    } else {
      return Stream.empty(); // or handle the unauthenticated case as needed
    }
  }

  Future<bool> isDone(String uuid, bool isDon) async {
    try{
      await _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({
        'isDon' : isDon,
      });
      return true;
  }catch(e){
      print(e);
      return true;
    }
  }

  Future<bool> Update_Note(String uuid, int image, String title, String subtitle) async {
    try{
      DateTime dateTime = new DateTime.now();
      await _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({
        'subtitle': subtitle,
        'image' : image,
        'time' : '${dateTime.hour}:${dateTime.minute}', //dateTime
        'title' : title,
      });
      return true;
    }catch(e){
      print(e);
      return true;
    }
  }

   Future<bool> delete_note(String uuid) async {
    try{
      await _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .delete();
      return true;
    }catch(e){
      print(e);
      return true;
    }
   }

}














