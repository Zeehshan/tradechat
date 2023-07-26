import 'package:flutter/material.dart';

import '../../painters/painters.dart';
import 'widgets/widgets.dart';

class ContacsPage extends StatelessWidget {
  const ContacsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ContactsBarWidget(),
            SliverToBoxAdapter(
              child: Container(
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: ContactsListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
