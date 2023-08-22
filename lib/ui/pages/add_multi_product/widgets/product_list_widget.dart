import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/controllers.dart';
import '../../../dialogs/dialogs.dart';
import 'widgets.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = Get.find<OrderDetailsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: GetBuilder<MyOrdersController>(builder: (myOrdersController) {
        return Table(
          border: null,
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
            4: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Text(
                  'Product',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Quantity',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Action',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            ...List.generate(
                myOrdersController.slectedOrder?.orderProducts.length ?? 0,
                (index) {
              final p = myOrdersController.slectedOrder?.orderProducts[index];
              final price =
                  NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
                      .format(p!.product!.price);
              final total =
                  NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
                      .format(myOrdersController
                              .slectedOrder!.orderProducts[index].quantity *
                          p.product!.price);
              return TableRow(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    p.product!.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, right: 10),
                  child: QuantityInputWidget(
                    p: p,
                    onChanged: (v) {
                      if (v.isNotEmpty) {
                        orderDetailsController.updateQuantity(
                            p.product!.id, int.parse(v));
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    '¥$price',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    '¥$total',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: InkWell(
                    child: const Icon(Icons.delete_forever),
                    onTap: () {
                      Future.value().then((value) =>
                          WarningAlertDialog.warningAlertDialog(
                                  context: context,
                                  message:
                                      'Are you sure you want to delete this Product from order.?')
                              .then((v) {
                            if (v == true) {
                              List<Map<String, int>> list = [];

                              for (final p0 in myOrdersController
                                  .slectedOrder!.orderProducts) {
                                if (p0.product?.id != p.product?.id) {
                                  list.add({
                                    'productId': p0.product!.id,
                                    'quantity': p0.quantity
                                  });
                                }
                              }
                              orderDetailsController.updateProducts(list,
                                  delete: true);
                            }
                          }));
                    },
                  ),
                )
              ]);
            }).toList()
          ],
        );
      }),
    );
  }
}

class TextFieldQuantityUpdateWidget extends StatefulWidget {
  const TextFieldQuantityUpdateWidget({super.key});

  @override
  State<TextFieldQuantityUpdateWidget> createState() =>
      _TextFieldQuantityUpdateWidgetState();
}

class _TextFieldQuantityUpdateWidgetState
    extends State<TextFieldQuantityUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
