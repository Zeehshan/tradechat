import 'package:flutter/material.dart';

import '../../configs/themes/themes.dart';

class DropDownWidget extends StatelessWidget {
  final Function() onEdit, onDelete;
  const DropDownWidget(
      {super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: onEdit,
          child: Row(
            children: [
              const Icon(
                Icons.edit_document,
                color: ThemeConfig.primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Edit',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: onDelete,
          child: Row(
            children: [
              const Icon(
                Icons.delete_forever_sharp,
                color: ThemeConfig.primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Delete',
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ],
      child: Icon(
        Icons.more_vert,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class DropDownModel {
  final String label;
  final Widget icon;

  DropDownModel(this.label, this.icon);
}
