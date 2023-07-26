import 'package:flutter/material.dart';
import 'package:tradechat/configs/themes/themes.dart';

class ContactsBarWidget extends StatelessWidget {
  const ContactsBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: ThemeConfig.primaryColor),
      centerTitle: true,
      title: Text(
        'Contacts List',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
      ),
    );
  }
}
