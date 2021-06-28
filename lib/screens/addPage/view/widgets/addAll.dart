import 'package:daiday/screens/navigator/navigator.dart';
import 'package:flutter/material.dart';

class AddAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
