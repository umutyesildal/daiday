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
    getCompanies();
  }

  Future? getCompanies() {
    BlocProvider.of<GeneralBloc>(context).add(GetDaylogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
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
                  state.isDaylogs == true
                      ? ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.allDaylogs!.length,
                          itemBuilder: (context, index) {
                            return MoodBubble(
                              mood: state.allDaylogs![index].mood,
                              activities: state.allDaylogs![index].activities,
                              color: Colors.red,
                              date: "21:58 - Today",
                              dayNotes: state.allDaylogs![index].notes,
                            );
                          },
                        )
                      : CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      );
    });
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
