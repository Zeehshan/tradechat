import 'package:flutter/material.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget(
      {super.key,
      required this.userName,
      required this.image,
      required this.desc});
  final String userName, image, desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: () {
          CreateChatDialog.createChatDialog(
              context: context, username: 'Zeeshan Ali');
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
                imageUrl: image,
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
                    'Zeeshan Ali',
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
                    'Flutter developer',
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
