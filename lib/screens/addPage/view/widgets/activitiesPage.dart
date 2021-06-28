import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          actions: [
            GestureDetector(
                onTap: () {
                  BlocProvider.of<GeneralBloc>(context).add(
                      GetSelectedActivitiesEvent(activities: activityList));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotesAndPhotosPage()));
                },
                child: Center(child: Text('Save')))
          ],
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text('What are you up to?'),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: activityList.length,
                itemBuilder: (context, index) {
                  return Text(activityList[index].activity);
                },
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  state.allActivities!.length,
                  (index) {
                    Activities activities = state.allActivities![index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          print(activityList.length);
                          if (activityList
                              .contains(state.allActivities![index])) {
                            activityList.remove(activities);
                          } else {
                            activityList.add(activities);
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(activities.emoji,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(activities.activity,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
