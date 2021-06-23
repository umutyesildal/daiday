import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10, right: 15),
      height: MediaQuery.of(context).size.height / 25, // 52
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(Icons.search, size: 16),
            ),
            TextSpan(
              text: " Search",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
