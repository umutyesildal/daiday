import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/mainPage/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addAll.dart';

class NotesAndPhotosPage extends StatefulWidget {
  @override
  _NotesAndPhotosPageState createState() => _NotesAndPhotosPageState();
}

class _NotesAndPhotosPageState extends State<NotesAndPhotosPage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
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
                  BlocProvider.of<GeneralBloc>(context)
                      .add(GetSelectedNote(note: myController.text.toString()));
                  AlertDialog(
                    title: Text('Eklemek İstediğinize emin misiniz?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          "Hayır",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Evet",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          BlocProvider.of<GeneralBloc>(context)
                              .add(AddDaylogEvent());
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                      ),
                    ],
                  );
                },
                child: Text('Send'))
          ],
        ),
      );
    });
  }
}
