import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../painters/painters.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class ContacsPage extends GetView<UsersController> {
  const ContacsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ContactsBarWidget(),
            SliverToBoxAdapter(
              child: Container(
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: controller.obx(
                (data) => const ContactsListWidget(),
                onEmpty: Container(),
                onError: (error) {
                  return Container();
                },
                onLoading: Padding(
                  padding: EdgeInsets.only(top: Get.height * .3),
                  child: const LoadingWidget(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
