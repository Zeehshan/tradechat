import 'package:flutter/material.dart';

class QuantityInputWidget extends StatefulWidget {
  const QuantityInputWidget({super.key});

  @override
  State<QuantityInputWidget> createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Quantiry for this product',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      ),
    );
  }
}
