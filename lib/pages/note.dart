import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note/services/apiconstant.dart';

class NoteKeepPage extends StatefulWidget {
  const NoteKeepPage({super.key});

  @override
  State<NoteKeepPage> createState() => _NoteKeepPageState();
}

class _NoteKeepPageState extends State<NoteKeepPage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  final now = DateTime.now();

  bool save = false;
  int userId = 0;

  void addNotes() async{
  if(_titleController.text.isNotEmpty || _contentController.text.isNotEmpty){
    var noteBody = {
      "userId" : userId,
      "title": _titleController.text,
      "content": _contentController.text
    };

    var response = await http.post(Uri.parse(noteGet),
    headers: {"content-type": "application/json"},
    body: jsonEncode(noteBody));

    var jsonRes = jsonDecode(response.body);
    print(jsonRes);

  }else {
    throw "Something went wrong";
  }
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              splashColor: null,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 201, 196, 196),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.arrow_back_ios),
              )),
          centerTitle: true,
          title: save == false? const Text("Keep you notes"): const Text(""),
          actions: [
            save == true? IconButton(onPressed: (){
              _contentController.clear();
              _titleController.clear();
              setState(() {
                save = false;
              });
            }, icon: const Icon(Icons.close,
              size: 30,)): Container(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: save == true? IconButton(onPressed: (){
                addNotes();
              }, icon: const Icon(Icons.check,
              size: 30,)): Container(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                maxLines: null,
                onChanged: (value) {
                  if( _titleController.text.isNotEmpty || _contentController.text.isNotEmpty) {
                    save = true;
                  }else {
                    save = false;
                  }
                  setState(() {
                    
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5
                  )
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(DateFormat.yMMMMd().add_jm().format(now),
              style: const TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 15
              ),),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                onChanged: (value) {
                  if( _contentController.text.isNotEmpty || _titleController.text.isNotEmpty) {
                    save = true;
                  }else {
                    save = false;
                  }
                  setState(() {
                    
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type something .....",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
