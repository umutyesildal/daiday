import 'package:daiday/screens/addPage/addPage.dart';
import 'package:daiday/screens/addPage/models/dayLog.dart';
import 'package:daiday/screens/mainPage/view/widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning 👋',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Umut Yeşildal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(),
                ),
                SearchBar(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Hive.box('logs').length,
                  itemBuilder: (context, index) {
                    DayLog log = Hive.box('logs').values.elementAt(index);
                    return MoodBubble(
                      mood: log.mood.mood,
                      activities: log.activities,
                      color: Colors.red,
                      date: "21:58 - Today",
                      dayNotes: log.notesAndPhotos.notes,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MoodBubble extends StatelessWidget {
  const MoodBubble({
    required this.activities,
    required this.color,
    required this.date,
    required this.dayNotes,
    required this.mood,
  });

  // These will all change when database implementation made.
  final String mood;
  final List<Activities> activities;
  final String dayNotes;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(-0.3, -0.3),
            colors: <Color>[
              color,
              Colors.black,
            ],
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "FEELING " + mood + " ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: activities.length.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            dayNotes,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            date,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
