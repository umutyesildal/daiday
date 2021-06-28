import 'package:daiday/addState/state/moodState.dart';
import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:local_storage/local_storage.dart';

import 'notesAndPhotosPage.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<Activities> activityList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Activities'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.allActivities!.length,
                itemBuilder: (context, index) {
                  bool isTapped = false;
                  Activities activities = state.allActivities![index];
                  return GestureDetector(
                    onTap: () {
                      print(activityList.length);
                      if (isTapped == false) {
                        activityList.add(activities);

                        isTapped = true;
                      } else {
                        activityList.remove(activities);
                        isTapped = false;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width / 7,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                            activities.emoji + ' ' + activities.activity,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotesAndPhotosPage()));
                },
                child: Text('Done'))
          ],
        ),
      );
    });
  }
}
