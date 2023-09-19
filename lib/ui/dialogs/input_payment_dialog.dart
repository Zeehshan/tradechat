import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../widgets/widgets.dart';

class InputPaymentDialog {
  static Future<String?> inputPaymentDialog({
    required BuildContext context,
    required String message,
  }) {
    return showGeneralDialog<String?>(
      barrierLabel: 'Label',
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, anim1, anim2) => Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
                child: _InputPaymentWidget(
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

class _InputPaymentWidget extends StatefulWidget {
  final String message;
  const _InputPaymentWidget({super.key, required this.message});

  @override
  State<_InputPaymentWidget> createState() => _InputPaymentWidgetState();
}

class _InputPaymentWidgetState extends State<_InputPaymentWidget> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.message,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
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
                  onPressed: controller.text.isEmpty
                      ? null
                      : () => Navigator.pop(context, controller.text),
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
