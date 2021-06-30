import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/mainPage/mainPage.dart';
import 'package:daiday/screens/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesAndPhotosPage extends StatefulWidget {
  @override
  _NotesAndPhotosPageState createState() => _NotesAndPhotosPageState();
}

class _NotesAndPhotosPageState extends State<NotesAndPhotosPage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'Write your note',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: new BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  BlocProvider.of<GeneralBloc>(context).add(
                      GetSelectedNoteEvent(note: myController.text.toString()));
                  print('sent');
                  print(state.selectedNote);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Eklemek İstediğinize emin misiniz?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "Hayır",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
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
                                generalBloc.add(AddDaylogEvent());
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute<MainNavigator>(
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: generalBloc,
                                        child: MainNavigator(),
                                      );
                                    },
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green.shade700),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
    });
  }
}
