import 'package:daiday/addState/state/moodState.dart';
import 'package:daiday/screens/addPage/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addAll.dart';

class NotesAndPhotosPage extends StatefulWidget {
  @override
  _NotesAndPhotosPageState createState() => _NotesAndPhotosPageState();
}

class _NotesAndPhotosPageState extends State<NotesAndPhotosPage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<MoodState>(
      builder: (context, state, widget) => Scaffold(
        appBar: AppBar(
          title: Text('Notes And Photos'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            TextFormField(
              controller: myController,
            ),
            TextButton(
                onPressed: () {
                  state.addNotesAndPhotos(
                      NotesAndPhotos(notes: myController.value.text));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAll()));
                },
                child: Text('Send'))
          ],
        ),
      ),
    );
  }
}
