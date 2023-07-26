import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ProductsWidget extends GetView<MyProductsController> {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String value = controller.searchQuery.value;
    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final p = controller.products[index];
            logger.d(p.image?.split(',').toList()[0]);
            if (value.toLowerCase().contains(p.title.toLowerCase())) {
              return Container();
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(.2),
                        offset: const Offset(0, 0))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NetworkImageWidget(
                      borderRadius: 4,
                      width: 60,
                      height: 60,
                      imageUrl: p.image == null
                          ? null
                          : Tools.displayImage(
                              p.image!.split(',').toList()[0])),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14),
                                ),
                                const Spacer(),
                                IconButton(
                                    splashRadius: 5,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                        maxWidth: 20, maxHeight: 20),
                                    onPressed: () {
                                      controller.seelectedProductForEdit(p);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 22,
                                    )),
                                const SizedBox(
                                  width: 12,
                                ),
                                IconButton(
                                    splashRadius: 5,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                        maxWidth: 20, maxHeight: 20),
                                    onPressed: () => controller.delete(p.id),
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      size: 22,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'Link: ${p.link}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text.rich(TextSpan(
                                text: 'Quantity:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 14),
                                children: [
                                  const TextSpan(text: ''),
                                  TextSpan(
                                    text: p.quantity.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 14),
                                  )
                                ])),
                            const Spacer(),
                            Text.rich(TextSpan(
                                text: 'Quantity:',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 14),
                                children: [
                                  const TextSpan(text: ''),
                                  TextSpan(
                                    text: p.quantity.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 14),
                                  )
                                ])),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
