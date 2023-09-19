import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';
import 'package:path/path.dart' as path;

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrdersController>(builder: (controller) {
      return Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No. Image',
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
                controller.slectedOrder!.orderProducts.length, (index) {
              final product = controller.slectedOrder!.orderProducts[index];
              final subPrice =
                  NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
                      .format(product.product!.price);
              final price =
                  NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
                      .format(product.quantity * product.product!.price);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
                    Expanded(
                      child: Row(
                        children: [
                          Text('${index + 1}'),
                          const SizedBox(
                            width: 12,
                          ),
                          NetworkImageWidget(
                            imageUrl:
                                Tools.displayImage(product.product?.image),
                            width: 50,
                            height: 50,
                            borderRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            product.product!.title,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 20,
                            child: Text(
                              product.quantity.toString(),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '¥$subPrice',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 12),
                          ),
                          const Spacer(),
                          Text(
                            '¥$price',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 40, top: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Builder(builder: (context) {
                return Text(
                  'Total ¥${controller.selectedOrderTotalPrice}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16),
                );
              }),
            ),
          ),
          if (controller.slectedOrder?.documents != {} &&
              controller.slectedOrder?.documents['files'] != null)
            Column(
              children: List.generate(
                  controller.slectedOrder?.documents['files'].length, (index) {
                final file =
                    controller.slectedOrder?.documents['files'][index]['file'];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        FileDialog.fileDialog(context: context, fileurl: file);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            fileIcon(path.extension(file)),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Text(
                              path.basename(file),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.black, fontSize: 14),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            )
        ],
      );
    });
  }
}
