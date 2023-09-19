import 'package:flutter/material.dart';

class AddMultiProductAppBarWidget extends StatelessWidget {
  const AddMultiProductAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xffededed),
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      elevation: 3,
      title: Text(
        '231212121',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
      ),
      centerTitle: true,
    );
  }
}
