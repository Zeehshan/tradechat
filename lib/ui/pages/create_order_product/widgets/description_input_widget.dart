import 'package:flutter/material.dart';

class DescriptionInputWidget extends StatefulWidget {
  const DescriptionInputWidget({super.key});

  @override
  State<DescriptionInputWidget> createState() => _DescriptionInputWidgetState();
}

class _DescriptionInputWidgetState extends State<DescriptionInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
            hintText: 'Description',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      ),
    );
  }
}
