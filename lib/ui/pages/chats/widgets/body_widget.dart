import 'package:flutter/material.dart';

import '../../../painters/painters.dart';
import 'widgets.dart';

class BodyWidghet extends StatelessWidget {
  const BodyWidghet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ChatsAppbarWidget(),
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 10,
        //     margin: const EdgeInsets.symmetric(horizontal: 20),
        //     width: MediaQuery.of(context).size.width,
        //     child: CustomPaint(
        //       painter: DashedLinePainter(),
        //     ),
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: ChatsWidget(),
        )
      ],
    );
  }
}
