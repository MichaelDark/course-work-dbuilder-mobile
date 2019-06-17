import 'package:flutter/material.dart';

class DataText extends StatelessWidget {
  final String title;
  final String data;

  const DataText(this.title, this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            data,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
