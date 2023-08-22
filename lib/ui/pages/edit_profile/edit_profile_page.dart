import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/edit_profile_controller.dart';
import '../../dialogs/dialogs.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backButtonCallback: () => Navigator.pop(context),
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<EditProfileController>(builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const EditPicturewidget(),
                ElevatedButtonWidget(
                    height: 42,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    child: Text(
                      'Reset Password',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                    onPressed: () {}),
                _headerWidget(context, 'Personal Details'),
                const Row(
                  children: [
                    Expanded(child: FnameInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: LnameInputWidget()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: UsernameInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: PhoneInputWidget()),
                  ],
                ),
                _headerWidget(context, 'Details for invoice'),
                const CompanyNameInputWidget(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: ManagerFNameInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: ManagerLNameInputWidget())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: CompanyPhoneInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: CompanyAddressInputWidget())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: CompanyCountryInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: CompanyCityInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: CompanyZipInputWidget())
                  ],
                ),
                _headerWidget(context, 'Delivery Address'),
                const DeliveryAddressInputWidget(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(child: DeliveryCountryInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: DeliveryCityInputWidget()),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(child: DeliveryZipInputWidget())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => ElevatedButtonWidget(
                      height: 42,
                      onPressed: !controller.isFormValidated.value
                          ? null
                          : () async {
                              final permission =
                                  await WarningAlertDialog.warningAlertDialog(
                                      context: context,
                                      message:
                                          'Are you sure you wants to save changes.?');
                              if (permission == true) {
                                controller.savedProfile();
                              }
                            },
                      child: Text(
                        'Save Changes',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _headerWidget(context, String v) {
    return Container(
      color: Colors.grey.shade200,
      height: 42,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        v,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
