import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    // getting all the data from database.
    getData();
  }

  Future? getData() {
    BlocProvider.of<GeneralBloc>(context).add(GetDaylogsEvent());
  }

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
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! 👋',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(),
                ),
                _searchBar(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(),
                ),
                state.isDaylogs == true
                    ? Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: state.logsToDisplay!.length,
                          itemBuilder: (context, index) {
                            return MoodBubble(
                              mood: state.logsToDisplay![index].mood,
                              activities:
                                  state.logsToDisplay![index].activities,
                              color:
                                  _getColor(state.logsToDisplay![index].mood),
                              date: state.logsToDisplay![index].date.length == 9
                                  ? state.logsToDisplay![index].date
                                      .substring(0, 4)
                                  : state.logsToDisplay![index].date
                                      .substring(0, 5),
                              dayNotes: state.logsToDisplay![index].notes,
                            );
                          },
                        ),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
    });
  }

// getting color according to mood.

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: 'Search',
        ),
        keyboardType: TextInputType.text,
        autocorrect: false,
        onChanged: (text) {
          text = text.toLowerCase();
          BlocProvider.of<GeneralBloc>(context)
              .add(SearchQueryChangedEvent(query: text));
          print('changed');
        },
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
                  text: "Feeling " + mood + " ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: activities[0].activity + ' ' + activities[0].emoji,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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
