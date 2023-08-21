import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) => [
      PopupMenuItem(
        child: Column(
          children: [
            Text("Delete")
          ],
        ),
      )
    ]);
  }
}