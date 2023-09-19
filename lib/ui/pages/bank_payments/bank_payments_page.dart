import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/routes/app_routes.dart';
import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgtes.dart';

class BankPaymentsPage extends StatelessWidget {
  const BankPaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PaymentsController>();
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        title: Text(
          'Paymets',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        backButtonCallback: () => Get.back(),
      ),
      body: Column(
        children: [
          ElevatedButtonWidget(
              borderRadius: 6,
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '+ New Payment',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
              onPressed: () async {
                await Get.toNamed(AppRoutes.newPayment);
                controller.loadPayments();
              }),
          const PaymentsWidget(),
        ],
      ),
    );
  }
}
