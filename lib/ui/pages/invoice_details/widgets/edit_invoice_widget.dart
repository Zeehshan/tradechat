import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class EditInvoiceWidget extends GetView<MyInvoicesController> {
  const EditInvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isEditView.value
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GetBuilder<MyInvoicesController>(
                builder: (myInvoicesController) {
              return Column(
                children: [
                  Text(
                    'Edit Invoice Name',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'PROFORMA INVOICE',
                          groupValue: controller.selectedInvoice!.name,
                          onChanged: (v) {
                            final selectedInvoice = controller.selectedInvoice!
                                .copyWith(name: 'PROFORMA INVOICE');
                            controller.updateInvoiceCalled(selectedInvoice);
                            controller.editNameCalled();
                          }),
                      Text(
                        'PROFORMA INVOICE',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'COMMERCIAL INVOICE',
                          groupValue: controller.selectedInvoice!.name,
                          onChanged: (v) {
                            final selectedInvoice = controller.selectedInvoice!
                                .copyWith(name: 'COMMERCIAL INVOICE');
                            controller.updateInvoiceCalled(selectedInvoice);
                            controller.editNameCalled();
                          }),
                      Text(
                        'COMMERCIAL INVOICE',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const EditInvoiceNumber(),
                  const DatePickerExample()
                ],
              );
            }),
          ));
  }
}

class EditInvoiceNumber extends StatefulWidget {
  const EditInvoiceNumber({super.key});

  @override
  State<EditInvoiceNumber> createState() => _EditInvoiceNumberState();
}

class _EditInvoiceNumberState extends State<EditInvoiceNumber> {
  late TextEditingController controller;
  final myInvoicesController = Get.find<MyInvoicesController>();
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
        text: myInvoicesController.selectedInvoice!.number);

    controller.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      final selectedInvoice = myInvoicesController.selectedInvoice!
          .copyWith(number: controller.text);
      myInvoicesController.updateInvoiceCalled(selectedInvoice);

      _debounce = Timer(const Duration(seconds: 2), () {});
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onSubmitted: (s) {
            myInvoicesController.editNameCalled();
          },
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2, horizontal: 10)),
        ));
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  static final myInvoicesController = Get.find<MyInvoicesController>();

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(
      DateTime.parse(myInvoicesController.selectedInvoice!.date));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.parse(myInvoicesController.selectedInvoice!.date),
          lastDate: DateTime(2050),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
        final selectedInvoice = myInvoicesController.selectedInvoice!
            .copyWith(date: newSelectedDate.toString());
        myInvoicesController.updateInvoiceCalled(selectedInvoice);
        myInvoicesController.editNameCalled();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _restorableDatePickerRouteFuture.present();
      },
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
          width: .1,
        )),
        child: Center(
          child: Text(
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
