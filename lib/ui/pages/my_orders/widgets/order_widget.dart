import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../configs/routes/app_routes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart' as dialogs;
import '../../../widgets/widgets.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel order;
  const OrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyOrdersController>();
    String date = '';
    final DateTime messageData = DateTime.parse(order.createdAt);

    date =
        '${DateFormat.yMMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
        child: TextButton(
          onLongPress: () {
            final RenderBox renderBox =
                Overlay.of(context).context.findRenderObject()! as RenderBox;
            Offset offset = renderBox.localToGlobal(const Offset(1, 50));
            SubMenue.showPopupMenu(
                context: context,
                offset: offset,
                onDelete: () {
                  dialogs.WarningAlertDialog.warningAlertDialog(
                          context: context,
                          message:
                              'Are you sure you want to delete this order.?')
                      .then((v) {
                    if (v == true) {
                      controller.deleteOrder(order.id);
                    }
                  });
                },
                onEdit: () {
                  controller.updateOrderCalled(order);
                  Get.toNamed(AppRoutes.addNewOrder);
                });
          },
          onPressed: () => controller.selectedOrder(order),
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                        text: 'Order name: ',
                        style: Theme.of(context).textTheme.labelMedium,
                        children: [
                          TextSpan(
                              text: order.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14))
                        ])),
                    const SizedBox(
                      height: 5,
                    ),
                    Text.rich(TextSpan(
                        text: 'Order#: ',
                        style: Theme.of(context).textTheme.labelMedium,
                        children: [
                          TextSpan(
                              text: order.id.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14))
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        NetworkImageWidget(
                          width: 80,
                          height: 80,
                          imageUrl: Tools.displayImage(order.image),
                          borderRadius: 2,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Total products: ${order.orderProducts.length}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        // const Spacer(),
                        // DropDownWidget(
                        //   onDelete: () {
                        //     Future.value().then((value) =>
                        //         dialogs.WarningAlertDialog.warningAlertDialog(
                        //                 context: context,
                        //                 message:
                        //                     'Are you sure you want to delete this order.?')
                        //             .then((v) {
                        //           if (v == true) {
                        //             controller.deleteOrder(order.id);
                        //           }
                        //         }));
                        //   },
                        //   onEdit: () {
                        //     Future.value().then((_) {
                        //       controller.updateOrderCalled(order);
                        //       Get.toNamed(AppRoutes.addNewOrder);
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.timer,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Order waiting for confirmation'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
