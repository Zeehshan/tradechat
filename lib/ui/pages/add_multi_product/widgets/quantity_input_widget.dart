import 'package:flutter/material.dart';

class QuantityInputWidget extends StatefulWidget {
  const QuantityInputWidget({super.key});

  @override
  State<QuantityInputWidget> createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 40,
        child: TextField(
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2, horizontal: 10)),
        ));
  }
}
