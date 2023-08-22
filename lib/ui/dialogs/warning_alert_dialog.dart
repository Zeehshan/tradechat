import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class WarningAlertDialog {
  static Future<bool?> warningAlertDialog(
      {required BuildContext context, required String message}) {
    return showGeneralDialog<bool?>(
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
                child: _WarningAlertDialogWidget(
              message: message,
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

class _WarningAlertDialogWidget extends StatelessWidget {
  final String message;
  const _WarningAlertDialogWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
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
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'No',
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
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    'Yes',
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
