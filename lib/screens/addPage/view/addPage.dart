import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daiday/screens/addPage/view/widgets/activitiesPage.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Moods'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.allMoods!.length,
                itemBuilder: (context, index) {
                  String selectedMood = state.allMoods![index];
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<GeneralBloc>(context)
                          .add(GetSelectedMood(mood: selectedMood));

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
                          selectedMood,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
