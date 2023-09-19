import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';

class ContactWidget extends StatelessWidget {
  final UserModel user;
  const ContactWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: () {
          logger.d(user.toJson());
          CreateChatDialog.createChatDialog(user: user, context: context);
        },
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.grey.withOpacity(.6),
                        offset: const Offset(0, 0))
                  ],
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: NetworkImageWidget(
                width: 60,
                height: 60,
                borderRadius: 100,
                imageUrl: user.profilePic,
                userId: user.id.toString(),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${user.username}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
