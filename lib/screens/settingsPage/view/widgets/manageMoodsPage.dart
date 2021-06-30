import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageMoodsPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ManageMoodsPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Add Mood'),
        ),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                  controller: myController,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    Text('Eklemek İstediğinize emin misiniz?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      "Hayır",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
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
                                      generalBloc.add(AddMoodEvent(
                                          mood: myController.text.toString()));

                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.allMoods!.length,
                    itemBuilder: (context, index) {
                      return Text(
                        state.allMoods![index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
