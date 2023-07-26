import 'package:flutter/material.dart';
import 'package:tradechat/ui/widgets/widgets.dart';

import 'widgets.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    color: Theme.of(context).colorScheme.background)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                borderRadius: BorderRadius.circular(30),
                value: null,
                onChanged: (value) {},
                items: [],
              ),
            ),
          ),
        ),
        const QuantityInputWidget(),
        SizedBox(
          width: 10,
        ),
        ElevatedButtonWidget(
            width: 35,
            height: 35,
            borderRadius: 100,
            child: Icon(Icons.add),
            onPressed: () {}),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
