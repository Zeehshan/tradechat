import 'package:flutter/material.dart';
import 'package:tradechat/ui/widgets/widgets.dart';

class PrlofileDetailsWidget extends StatelessWidget {
  const PrlofileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(.2),
                offset: const Offset(0, 0))
          ]),
      child: Row(
        children: [
          const NetworkImageWidget(
              borderRadius: 2, width: 80, height: 80, imageUrl: null),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                    text: 'Username:',
                    style: Theme.of(context).textTheme.labelMedium,
                    children: [
                      TextSpan(
                          text: 'Zeeshan Ali',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14))
                    ])),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(TextSpan(
                    text: 'User id:',
                    style: Theme.of(context).textTheme.labelMedium,
                    children: [
                      TextSpan(
                          text: '5122472',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14))
                    ])),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
