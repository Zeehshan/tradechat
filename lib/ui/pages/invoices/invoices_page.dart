import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

import '../../../controllers/controllers.dart';
import '../../dialogs/dialogs.dart';
import 'widgets/widgets.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetX<MyInvoicesController>(
          init: MyInvoicesController(),
          initState: (state) {},
          builder: (MyInvoicesController controller) {
            if (controller.manageUI.value.uiStatus ==
                GetStateUIStatus.loading) {
              return const LoadingWidget();
            }
            return CustomScrollView(
              slivers: [
                const InvoicesAppbarWidget(),
                SliverToBoxAdapter(
                  child: ElevatedButtonWidget(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      onPressed: () {
                        AddInvoiceDialoig.addInvoiceDialoig(context: context);
                      },
                      child: Text(
                        '+ New Invoice',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      )),
                ),
                const SliverToBoxAdapter(
                  child: InvoiceListWidget(),
                ),
              ],
            );
          }),
    ));
  }
}
