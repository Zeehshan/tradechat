import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/routes/app_routes.dart';
import '../../../controllers/controllers.dart';
import '../../dialogs/input_payment_dialog.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthenticationController>();
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        backButtonCallback: () => Get.back(),
      ),
      body: Column(
        children: [
          Container(
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
              onPressed: () async {
                final password = await InputPaymentDialog.inputPaymentDialog(
                    context: context, message: 'New Payment Password');
                if (password != null) {
                  auth.updatePassword(password);
                }
              },
              child: Row(
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      )),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Payment Password',
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
          ),
          Container(
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
              onPressed: () async {
                Get.toNamed(AppRoutes.editProfile,
                    arguments: EditProfilePageAruguments(isforProfile: false));
              },
              child: Row(
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.details,
                        color: Theme.of(context).primaryColor,
                      )),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Details for invoice & delivery adress',
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
          ),
        ],
      ),
    );
  }
}
