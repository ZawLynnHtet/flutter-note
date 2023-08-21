import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note/pages/note.dart';
import 'package:note/pages/notedetails.dart';
import 'package:note/services/note_service.dart';

import '../model/note_model.dart';


class ShowNotes extends StatefulWidget {
  const ShowNotes({super.key,});

  @override
  State<ShowNotes> createState() => _ShowNotesState();
}

class _ShowNotesState extends State<ShowNotes> {

  final now = DateTime.now();

  String title = "Lorem ipsum dolor sit amet";
  String content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod lacinia augue, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod lacinia augue";

  List<Note> notes = [];

  getNotes() async {
    debugPrint("______");
    notes = await noteApi();
    print("__________${notes.length}");
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
  }
  @override
  Widget build(BuildContext context) {
    return notes.isEmpty? const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    ): SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => NoteDetails(title: title, content: content)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 180, 228),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Text(notes[index].title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                ),
                const SizedBox(height: 10,),
                Text(notes[index].content,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(
                  height: 10,
                ),
                Text(DateFormat.yMMMMd().format(notes[index].timestamp),
                style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 13
              ),),
              ],
            ),
          ),
        );
      })),
    );
  }
}