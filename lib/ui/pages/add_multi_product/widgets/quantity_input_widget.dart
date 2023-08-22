import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';

class QuantityInputWidget extends StatefulWidget {
  final OrderProductModel? p;
  final Function(String)? onChanged;
  const QuantityInputWidget({super.key, this.p, this.onChanged});

  @override
  State<QuantityInputWidget> createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  late TextEditingController controller;
  final orderDetailsController = Get.find<OrderDetailsController>();
  @override
  void initState() {
    super.initState();
    controller =
        TextEditingController(text: widget.p?.quantity.toString() ?? '1');
    controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(controller.text);
      } else {
        orderDetailsController.updateQuantit(controller.text);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 40,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2, horizontal: 10)),
        ));
  }
}
