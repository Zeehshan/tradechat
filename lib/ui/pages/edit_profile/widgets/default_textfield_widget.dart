import 'package:flutter/material.dart';

class DefaultTextfieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool required;
  final TextInputType? keyboardType;
  const DefaultTextfieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.required = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
              text: hintText,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12),
              children: [
                if (required)
                  TextSpan(
                    text: '*',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12, color: Colors.red),
                  ),
              ]),
        ),
        const SizedBox(
          height: 2,
        ),
        TextField(
          controller: controller,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
          keyboardType: keyboardType,
          decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 14, color: Colors.grey)),
        ),
      ],
    );
  }
}
