import 'package:flutter/material.dart';

import '../ui/dialogs/dialogs.dart';

class SubMenue {
  static showPopupMenu({
    required BuildContext context,
    required Offset offset,
    Function()? onEdit,
    Function()? onDelete,
  }) async {
    Offset offs = offset;
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offs, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero) + offs,
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final List<OptionModel> menues = [
      if (onEdit != null) OptionModel(icon: Icons.edit, title: 'Edit', id: 0),
      if (onDelete != null)
        OptionModel(icon: Icons.delete, title: 'Delete', id: 1),
    ];
    await showMenu(
      context: context,
      position: position,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      items: menues
          .map(
            (e) => PopupMenuItem(
              onTap: () {
                Future.delayed(Duration.zero, () async {
                  switch (e.id) {
                    case 0:
                      onEdit!();
                      break;
                    case 1:
                      onDelete!();
                      break;
                  }
                });
              },
              child: Row(
                children: [
                  Icon(
                    e.icon,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    e.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      elevation: 8.0,
    );
  }
}

class OptionModel {
  final IconData icon;
  final String title;
  final int id;

  OptionModel({required this.icon, required this.title, required this.id});
}
