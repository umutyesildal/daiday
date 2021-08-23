import 'package:daiday/data/activities.dart';
import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<Activities> activityList = [];
  List<bool> isAddedList =
      List.filled(ActivityData().activityData.length, false);
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Activites'),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'What are you up to?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(
                      ActivityData().activityData.length,
                      (index) {
                        Activities activities =
                            ActivityData().activityData[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isAddedList[index] == true) {
                                isAddedList[index] = false;
                                BlocProvider.of<GeneralBloc>(context).add(
                                    DeleteSelectedActivitiesEvent(
                                        activities: activities));
                              } else {
                                BlocProvider.of<GeneralBloc>(context).add(
                                    AddSelectedActivitiesEvent(
                                        activities: activities));
                                isAddedList[index] = true;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 7,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: isAddedList[index]
                                        ? Colors.red
                                        : Theme.of(context)
                                            .accentIconTheme
                                            .color!),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    activities.emoji,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    activities.activity,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Note',
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
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: state.isActivitiesSelected
                      ? () {
                          BlocProvider.of<GeneralBloc>(context).add(
                              GetSelectedNoteEvent(
                                  note: myController.text.toString()));
                          print('sent');
                          print(state.selectedNote);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Eklemek İstediğinize emin misiniz?'),
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
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
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
                        }
                      : null,
                  child: Text(
                    '     Send     ',
                    style: TextStyle(
                        color: state.isActivitiesSelected
                            ? Theme.of(context).primaryIconTheme.color
                            : Theme.of(context).dividerColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
