import 'package:flutter/material.dart';

class TitleInputWidget extends StatefulWidget {
  const TitleInputWidget({super.key});

  @override
  State<TitleInputWidget> createState() => _TitleInputWidgetState();
}

class _TitleInputWidgetState extends State<TitleInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Title',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      ),
    );
  }
}
