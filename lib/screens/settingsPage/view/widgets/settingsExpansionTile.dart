import 'package:flutter/material.dart';

class ExpansionTileItem extends StatelessWidget {
  const ExpansionTileItem({
    required this.givenText,
  });

  final String givenText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Text(
          givenText,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
