import 'package:flutter/material.dart';

class NewOrderAppbarWidget extends StatelessWidget {
  const NewOrderAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3,
      title: Text(
        'Create new order',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.clear_outlined,
              color: Theme.of(context).primaryColor,
            ))
      ],
    );
  }
}
