import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/screen/add_note_screen.dart';
import 'package:to_do_app/screen/home.dart';
import 'package:to_do_app/widgets/task_widgets.dart';

import 'auth/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),  //mainPage() //home(),
    );
  }
}


