import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CreateChatDialog {
  static createChatDialog(
      {required BuildContext context, required String username}) {
    return showGeneralDialog<dynamic>(
      barrierLabel: 'Label',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, anim1, anim2) => Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
                child: CreateChatAlertWidget(
              username: username,
            )),
          )),
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
  }
}

class CreateChatAlertWidget extends StatelessWidget {
  final String username;
  const CreateChatAlertWidget({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Are you sure you want to start a chat with $username',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButtonWidget(
                  height: 40,
                  backgroundColor: Colors.transparent,
                  borderSide: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButtonWidget(
                  height: 40,
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Create',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.white),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
