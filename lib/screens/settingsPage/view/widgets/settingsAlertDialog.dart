import 'package:flutter/material.dart';

class SettingsAlertDialog extends StatelessWidget {
  const SettingsAlertDialog({
    required this.givenHeader,
    required this.givenSubheader,
    required this.givenChoice1,
    required this.givenChoice2,
    required this.givenFunction,
  });

  final String givenHeader;
  final String givenSubheader;
  final String givenChoice1;
  final String givenChoice2;
  final Function givenFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Text(
              givenHeader,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              givenSubheader,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                    child: Text(
                      givenChoice1,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffE33691))),
                    child: Text(
                      givenChoice2,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      givenFunction();
                    })
              ])
        ],
      ),
    );
  }
}
