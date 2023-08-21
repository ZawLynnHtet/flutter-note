import 'package:http/http.dart' as http;
import '../model/note_model.dart';
import 'apiconstant.dart';

Future<List<Note>> noteApi() async {
  final url = Uri.parse(noteGet);
  var response = await http.get(url);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    var jsonRes = Notes.fromRawJson(response.body);
    return jsonRes.notes;
  } else {
    throw ("Something went wrong ${response.statusCode}");
  }
}