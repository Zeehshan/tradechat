import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No Image',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Name',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Qty.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Price',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Amount',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(
              4,
              (index) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('${index + 1}'),
                            const SizedBox(
                              width: 12,
                            ),
                            const NetworkImageWidget(
                              imageUrl: null,
                              width: 50,
                              height: 50,
                              borderRadius: 2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            'product name',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 60,
                          child: Text(
                            '2',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 60,
                          child: Text(
                            '¥2',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          child: Text(
                            '¥4',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 40, top: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Total ¥4',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
