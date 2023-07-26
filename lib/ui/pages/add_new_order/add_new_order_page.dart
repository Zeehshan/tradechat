import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class AddNewOrderPage extends StatelessWidget {
  const AddNewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BodyWidget()),
    );
  }
}
