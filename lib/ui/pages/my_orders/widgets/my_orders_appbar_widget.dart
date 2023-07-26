import 'package:flutter/material.dart';

class MyOrderAppbarWidget extends StatelessWidget {
  const MyOrderAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3,
      title: Text(
        'My orders',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
    );
  }
}
