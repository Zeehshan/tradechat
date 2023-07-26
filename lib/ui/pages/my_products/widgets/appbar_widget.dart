import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3,
      title: Text(
        'Products',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
    );
  }
}
