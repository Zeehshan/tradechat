import 'package:flutter/material.dart';
import 'package:tradechat/ui/pages/contacts/widgets/widgets.dart';

class ContactsListWidget extends StatelessWidget {
  const ContactsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 40,
      itemBuilder: (context, index) {
        return const ContactWidget();
      },
    );
  }
}
