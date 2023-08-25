import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/routes/app_routes.dart';
import '../../../configs/themes/themes.dart';
import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class SignUpPage extends GetView<SignupController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Obx(() => IgnorePointer(
                      ignoring: controller.isSingupPressed.value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to 1688 Tradechat',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const EmailInputWidget(),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const PasswordInputWidget(),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButtonWidget(
                              onPressed: !controller.isReady.value
                                  ? null
                                  : () => controller.singUp(),
                              child: Text(
                                'Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        color: Colors.white,
                                        fontFamily: ThemeConfig.pubicSansBold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'or',
                                style: Theme.of(context).textTheme.labelSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () => Get.offAllNamed(AppRoutes.login),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Don't have an account?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      children: [
                                        TextSpan(
                                          text: 'Log in',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
