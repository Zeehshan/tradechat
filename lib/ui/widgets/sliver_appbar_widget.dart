import 'package:flutter/material.dart';

class SliverAppbarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  const SliverAppbarWidget({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
