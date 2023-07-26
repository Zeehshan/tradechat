import 'package:flutter/material.dart';

class PriceInputWidget extends StatefulWidget {
  const PriceInputWidget({super.key});

  @override
  State<PriceInputWidget> createState() => _PriceInputWidgetState();
}

class _PriceInputWidgetState extends State<PriceInputWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Price',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      ),
    );
  }
}
