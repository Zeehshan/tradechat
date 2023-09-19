import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/routes/app_routes.dart';
import '../../widgets/widgets.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        title: Text(
          'Payments',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        backButtonCallback: () => Get.back(),
      ),
      body: Column(
        children: List.generate(2, (index) {
          final title = index == 0 ? 'Allied Bank Payments' : 'Wallet';
          final IconData icon = index == 0 ? Icons.money : Icons.wallet;
          return Container(
            height: 42,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 2)),
              onPressed: () {
                if (index == 0) {
                  Get.toNamed(AppRoutes.bankPayments);
                } else {
                  Get.toNamed(AppRoutes.wallet);
                }
              },
              child: Row(
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: Icon(
                        icon,
                        color: Colors.yellow,
                      )),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
