import 'package:flutter/material.dart';

class LinkInputWidget extends StatefulWidget {
  const LinkInputWidget({super.key});

  @override
  State<LinkInputWidget> createState() => _LinkInputWidgetState();
}

class _LinkInputWidgetState extends State<LinkInputWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Link',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      ),
    );
  }
}
