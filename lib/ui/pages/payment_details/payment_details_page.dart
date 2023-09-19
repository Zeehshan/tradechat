import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/controllers.dart';
import '../../../data/repositories/repositories.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../dialogs/dialogs.dart';
import '../../widgets/widgets.dart';

class PaymentDetailsPageArgument {
  final PaymentModel payment;

  PaymentDetailsPageArgument({required this.payment});
}

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  bool loading = false;

  final argument = Get.arguments as PaymentDetailsPageArgument;
  late PaymentModel p;
  @override
  void initState() {
    super.initState();
    p = argument.payment;
    setState(() {});
  }

  final paymentscontroller = Get.find<PaymentsController>();
  confirm(int id, String amount) async {
    try {
      setState(() {
        loading = true;
      });
      final PaymentModel payment = await AppApiRepostory()
          .confirmAmount(amount: int.parse(amount), id: id);
      paymentscontroller.addNewPayment(payment);
      p = payment;

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.find<AuthenticationController>().profile.value;
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        title: Text(
          'Payment No. ${p.id}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        backButtonCallback: () => Get.back(),
      ),
      body: ListView(
        children: [
          NetworkImageWidget(
              height: 200, imageUrl: Tools.displayImage(p.image)),
          const Divider(
            thickness: 2,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Order#'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Sender'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Payment#'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Amount'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Status'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Sent date'),
                  ),
                  if (p.confirmedAmount != null)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Confimred Amount'),
                    ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(p.orderNumber),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(p.senderName),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(p.id.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Tools.numberFormat(p.amount.toString())),
                  ),
                  p.status == 'pending'
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.hourglass_top_rounded,
                            color: Colors.red,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(DateFormat('yMMMd')
                        .format(DateTime.parse(p.createdAt))),
                  ),
                  if (p.confirmedAmount != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          Tools.numberFormat(p.confirmedAmount.toString())),
                    ),
                ],
              ))
            ],
          ),
          if (p.confirmedAmount == null && user.user?.role == 'admin')
            ElevatedButtonWidget(
                showProgressIndicator: loading,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  'Confirm Payment',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
                onPressed: () async {
                  final String? amount =
                      await InputPaymentDialog.inputPaymentDialog(
                          context: context, message: 'Enter recievecd amount');
                  if (amount != null) {
                    confirm(p.id, amount);
                  }
                })
        ],
      ),
    );
  }
}
