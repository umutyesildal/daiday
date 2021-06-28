import 'package:daiday/screens/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:daiday/addState/state/moodState.dart';

import '../../addPage.dart';

class AddAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoodState>(
      builder: (context, state, widget) => Scaffold(
        appBar: AppBar(
          title: Text('Add Daylog'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainNavigator()),
                (Route<dynamic> route) => false,
              );
            },
            child: Text('Add new Daylog'),
          ),
        ),
      ),
    );
  }
}
