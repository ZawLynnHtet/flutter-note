import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/components/notekeep.dart';
import 'package:note/pages/note.dart';
import 'package:note/pages/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegisterPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        title: const Text('Notes',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30,right: 10),
        child: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const NoteKeepPage()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add,
        color: Colors.white,
        size: 30,),),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ShowNotes(),
      ),
    );
  }
}
