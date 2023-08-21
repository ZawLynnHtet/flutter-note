import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget {
  NoteDetails({super.key, required this.title, required this.content});

  String title;
  String content;

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  final now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.title;
    _contentController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: PopupMenuButton(
                  color: Colors.white,
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                "Delete",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Delete",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Delete",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Delete",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                  child: const Icon(
                    Icons.more_vert,
                    size: 30,
                  )))
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
                setState(() {});
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              DateFormat.yMMMMd().format(now),
              style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type something .....",
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5)),
            )
          ],
        ),
      ),
    );
  }
}
