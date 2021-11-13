import 'package:flutter/material.dart';

class ProgressIndicatorCircle extends StatelessWidget {
  const ProgressIndicatorCircle({this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(text ?? 'Loading...')
        ],
      ),
    );
  }
}