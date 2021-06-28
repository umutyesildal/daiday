import 'package:daiday/screens/bloc/general_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageActivitiesPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ManageActivitiesPage> {
  final myControllerActivity = TextEditingController();
  final myControllerEmoji = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final generalBloc = BlocProvider.of<GeneralBloc>(context);

    return BlocBuilder<GeneralBloc, GeneralState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: myControllerActivity,
                ),
                TextFormField(
                  controller: myControllerEmoji,
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Eklemek İstediğinize emin misiniz?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    "Hayır",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
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
                                    generalBloc.add(AddActivitiesEvent(
                                        activity: myControllerActivity.text
                                            .toString(),
                                        emoji:
                                            myControllerEmoji.text.toString()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text('Send')),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.allActivities!.length,
                    itemBuilder: (context, index) {
                      return Text(state.allActivities![index].emoji +
                          state.allActivities![index].activity);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
