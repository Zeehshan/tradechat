import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tradechat/configs/routes/app_routes.dart';
import 'package:tradechat/configs/themes/themes.dart';

import '../../../../controllers/controllers.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  List<OptionModel> options = [
    OptionModel(
        const FaIcon(
          FontAwesomeIcons.shop,
          color: ThemeConfig.primaryColor,
          size: 20,
        ),
        'My products'),
    OptionModel(
        const FaIcon(
          FontAwesomeIcons.file,
          color: ThemeConfig.primaryColor,
          size: 25,
        ),
        'My Orders'),
    OptionModel(
        const FaIcon(
          FontAwesomeIcons.fileInvoice,
          color: ThemeConfig.primaryColor,
          size: 25,
        ),
        'My Invoices'),
    OptionModel(
        const Icon(
          CupertinoIcons.money_yen,
          color: ThemeConfig.primaryColor,
        ),
        'My Payments'),
    OptionModel(
        const Icon(
          CupertinoIcons.settings,
          color: ThemeConfig.primaryColor,
        ),
        'Settings'),
  ];
  final ScaffoldWithNavbarController scaffoldWithNavbarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          options.length,
          (index) => Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 2)),
                  onPressed: () => _navigate(index),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20, height: 20, child: options[index].icon),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        options[index].label,
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
              )),
    );
  }

  _navigate(int index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.myProducts);
        break;
      case 1:
        scaffoldWithNavbarController.changePage(1);
        break;
      case 2:
        Get.toNamed(AppRoutes.invoices);
        break;
    }
  }
}

class OptionModel {
  final Widget icon;
  final String label;

  OptionModel(this.icon, this.label);
}
