import 'package:daiday/data/moods.dart';
import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daiday/screens/addPage/view/widgets/activitiesPage.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Color _getColor(String mood) {
    switch (mood) {
      case "Cheerful":
        return Color(0xff1CD919);
      case "Happy":
        return Color(0xff2C790E);

      case "Good":
        return Color(0xff006df3);

      case "Cool":
        return Color(0xff006e9b);

      case "Meh":
        return Color(0xffD5E412);

      case "Bad":
        return Color(0xffc49603);

      case "Sad":
        return Color(0xffd76f03);

      case "Stressed":
        return Color(0xffeb3d01);

      default:
        return Color(0xffA50F0F);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Moods'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'How are you?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  MoodData().moodData.length,
                  (index) {
                    String selectedMood = MoodData().moodData[index];

                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<GeneralBloc>(context)
                            .add(GetSelectedMoodEvent(mood: selectedMood));

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
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(-0.1, -0.1),
                              colors: <Color>[
                                _getColor(selectedMood),
                                Colors.black,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            selectedMood,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentIconTheme.color),
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
