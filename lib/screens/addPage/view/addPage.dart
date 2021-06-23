import 'package:daiday/addState/state/moodState.dart';
import 'package:daiday/screens/addPage/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:daiday/screens/addPage/view/widgets/activitiesPage.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoodState>(
      builder: (context, state, widget) => Scaffold(
        appBar: AppBar(
          title: Text('Moods'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Hive.box('moods').length,
                itemBuilder: (context, index) {
                  Mood mood = Hive.box('moods').values.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      state.addMood(mood);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivitiesPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width / 7,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                          color: Colors.white, //SHOULD BE BLACK
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          mood.mood,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
