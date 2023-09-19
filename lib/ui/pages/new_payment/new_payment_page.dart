import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../widgets/widgets.dart';
import 'widgets/input_account_widget.dart';
import 'widgets/widgets.dart';

class NewPaymentArguments {
  final PaymentModel payment;

  NewPaymentArguments({required this.payment});
}

class NewPaymentPage extends StatelessWidget {
  const NewPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        title: Text(
          'Create New Payment',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        backButtonCallback: () => Get.back(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            InputAmountWidget(),
            InputNameWidget(),
            InputOrderWidget(),
            InputAccountWidget(),
            AccountTypeWidget(),
            DocumentUploadWidget(),
            ButtonsWidget()
          ],
        ),
      ),
    );
  }
}
