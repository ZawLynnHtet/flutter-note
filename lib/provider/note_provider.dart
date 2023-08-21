// import 'package:flutter/cupertino.dart';
// import 'package:note/services/note_service.dart';

// import '../model/note_model.dart';

// class NoteProvider with ChangeNotifier {
//   List<Note> notes = [];

//   void addNote(Note note) {
//     notes.add(note);
//     ApiService.addNote(note);
//     notifyListeners();
//   }

//   void updateNote(Note note){
//     int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
//     notes[indexOfNote] = note;
//     notifyListeners();
//   }

//   void deleteNote(Note note){
//     int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
//     notes[indexOfNote] = note;
//     notifyListeners();
//   }
// }