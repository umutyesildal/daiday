import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:daiday/screens/mainPage/view/widgets/searchBar.dart';
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
                              date: state.logsToDisplay![index].date
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
  Color _getColor(String mood) {
    if (mood == "Happy") {
      return Colors.blue;
    } else if (mood == "Exhausted") {
      return Colors.orange;
    } else if (mood == "Sad") {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

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
