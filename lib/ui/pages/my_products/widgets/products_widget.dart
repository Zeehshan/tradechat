import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';

class ProductsWidget extends GetView<MyProductsController> {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String value = controller.searchQuery.value;

      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: true,
        itemCount: controller.products.length,
        itemBuilder: (_, index) {
          final p = controller.products[index];
          if (value.isNotEmpty &&
              !p.title.toLowerCase().contains(value.toLowerCase())) {
            return Container();
          }
          return ProductWidget(p);
        },
      );
    });
  }
}

class ProductWidget extends GetView<MyProductsController> {
  final MyProductDataModel p;
  const ProductWidget(this.p, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onLongPress: () {
            final RenderBox renderBox =
                Overlay.of(context).context.findRenderObject()! as RenderBox;
            Offset offset = renderBox.localToGlobal(const Offset(1, 20));
            SubMenue.showPopupMenu(
                context: context,
                offset: offset,
                onDelete: () {
                  WarningAlertDialog.warningAlertDialog(
                          context: context,
                          message:
                              'Are you sure you want to delete this Product.?')
                      .then((v) {
                    if (v == true) {
                      controller.delete(p.id);
                    }
                  });
                },
                onEdit: () {
                  logger.d('valled');
                  controller.seelectedProductForEdit(p);
                });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NetworkImageWidget(
                    borderRadius: 4,
                    width: 60,
                    height: 60,
                    imageUrl: p.image == null
                        ? null
                        : Tools.displayImage(p.image!.split(',').toList()[0])),
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
                              // IconButton(
                              //     splashRadius: 5,
                              //     padding: EdgeInsets.zero,
                              //     constraints: const BoxConstraints(
                              //         maxWidth: 20, maxHeight: 20),
                              //     onPressed: () {
                              //       controller.seelectedProductForEdit(p);
                              //     },
                              //     icon: const Icon(
                              //       Icons.edit,
                              //       size: 22,
                              //     )),
                              const SizedBox(
                                width: 12,
                              ),
                              // IconButton(
                              //     splashRadius: 5,
                              //     padding: EdgeInsets.zero,
                              //     constraints: const BoxConstraints(
                              //         maxWidth: 20, maxHeight: 20),
                              //     onPressed: () {},
                              //     icon: const Icon(
                              //       Icons.delete_forever,
                              //       size: 22,
                              //     )),
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
                              text: 'Price: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 14),
                              children: [
                                const TextSpan(text: ''),
                                TextSpan(
                                  text: '¥${p.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14),
                                )
                              ])),
                          const Spacer(),
                          Text.rich(TextSpan(
                              text: 'Quantity: ',
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
          ),
        ),
      ),
    );
  }
}
