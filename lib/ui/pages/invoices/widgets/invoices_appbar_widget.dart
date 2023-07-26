import 'package:flutter/material.dart';

class InvoicesAppbarWidget extends StatelessWidget {
  const InvoicesAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      elevation: 3,
      title: Text(
        'Invoices',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
      ),
      centerTitle: true,
    );
  }
}
