import 'package:flutter/material.dart';

import 'widgets.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MyProfileAppbarWidget(),
        SliverToBoxAdapter(
          child: PrlofileDetailsWidget(),
        ),
        SliverToBoxAdapter(
          child: OptionsWidget(),
        )
      ],
    );
  }
}
