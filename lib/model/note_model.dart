import 'dart:convert';

class Notes {
    String status;
    int data;
    List<Note> notes;

    Notes({
        required this.status,
        required this.data,
        required this.notes,
    });

    factory Notes.fromRawJson(String str) => Notes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        status: json["status"],
        data: json["data"],
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
    };
}

class Note {
    String id;
    String userId;
    String title;
    String content;
    DateTime timestamp;

    Note({
        required this.id,
        required this.userId,
        required this.title,
        required this.content,
        required this.timestamp,
    });

    factory Note.fromRawJson(String str) => Note.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["_id"],
        userId: json["userId"],
        title: json["title"],
        content: json["content"],
        timestamp: DateTime.parse(json["timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "title": title,
        "content": content,
        "timestamp": timestamp.toIso8601String(),
    };
}
