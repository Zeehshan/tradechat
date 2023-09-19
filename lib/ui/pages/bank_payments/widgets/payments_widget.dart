import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../configs/routes/app_routes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class PaymentsWidget extends GetView<PaymentsController> {
  const PaymentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (payments) => Expanded(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              showCheckboxColumn: false,
              dataRowMaxHeight: 50,
              dataRowMinHeight: 50,
              dividerThickness: 1.0,
              columnSpacing: 10,
              columns: [
                DataColumn(
                  label: Text(
                    'Order#',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    child: Text(
                      'Sender',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Payment#',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Amount',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    child: Text(
                      'Sent',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Action',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ],
              rows: payments
                      ?.map((e) => DataRow(
                              selected: false,
                              onSelectChanged: (value) {
                                Get.toNamed(AppRoutes.paymentDetails,
                                    arguments:
                                        PaymentDetailsPageArgument(payment: e));
                              },
                              cells: [
                                DataCell(Text(
                                  e.orderNumber,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 13),
                                )),
                                DataCell(SizedBox(
                                  width: 80,
                                  child: Text(
                                    e.senderName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 13),
                                  ),
                                )),
                                DataCell(SizedBox(
                                    width: 80,
                                    child: Text(
                                      e.id.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 13),
                                    ))),
                                DataCell(Text(
                                  '${Tools.numberFormat(e.amount.toString())}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 13),
                                )),
                                DataCell(e.status == 'pending'
                                    ? const Icon(
                                        Icons.hourglass_top_rounded,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    DateFormat('yMMMd')
                                        .format(DateTime.parse(e.createdAt)),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 13, color: Colors.red),
                                  ),
                                )),
                                if (e.confirmedAmount == null)
                                  DataCell(
                                    DropDownWidget(
                                      onDelete: () {
                                        Future.value().then((_) {
                                          controller.deletePayment(e.id);
                                        });
                                      },
                                      onEdit: () {
                                        Future.value().then((_) async {
                                          await Get.toNamed(
                                              AppRoutes.newPayment,
                                              arguments: NewPaymentArguments(
                                                  payment: e));
                                          controller.loadPayments();
                                        });
                                      },
                                    ),
                                  ),
                                if (e.confirmedAmount != null)
                                  DataCell(Container())
                              ]))
                      .toList() ??
                  [],
              //   rows: ListView.builder(
              //     padding: const EdgeInsets.all(10.0),
              //     itemBuilder: (context, index) {
              //       final message = messgaes![index];
              //       if (message.senderId == currentUser?.id) {
              //         // Right (my message)

              //         return SentMessage(
              //           message: message,
              //         );
              //       } else {
              //         // Left (peer message)

              //         return ReceivedMessageWidget(
              //           message: message,
              //         );
              //       }
              //     },
              //     itemCount: messgaes?.length,
              //     reverse: true,
              //   ),
              // ),
            ),
          ),
        ),
      ),
      onLoading: const Expanded(child: LoadingWidget()),
      onEmpty: Expanded(child: Container()),
      onError: (error) => Expanded(child: Container()),
    );
  }
}
