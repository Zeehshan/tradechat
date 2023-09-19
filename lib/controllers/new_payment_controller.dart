import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/pages/pages.dart';
import '../utils/utils.dart';

class NewPaymentController extends GetxController {
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  final LocalRepository localRepository = Get.find<LocalRepository>();

  RxBool isFormValidated = false.obs;
  TextInput amount = const TextInput.dirty();
  TextInput senderName = const TextInput.pure();
  TextInput orderNumber = const TextInput.pure();
  TextInput accountNumber = const TextInput.pure();

  RxString accountType = ''.obs;

  RxString image = ''.obs;

  final argument = Get.arguments as NewPaymentArguments?;

  @override
  onInit() {
    super.onInit();
    if (argument != null) {
      accountTypeChanged(argument!.payment.accountType);
    }
  }

  amountChanged(String v) {
    amount = TextInput.pure(v);
    _validationForm();
  }

  senderNameChanged(String v) {
    senderName = TextInput.pure(v);
    _validationForm();
  }

  orderNumberChanged(String v) {
    orderNumber = TextInput.pure(v);
    _validationForm();
  }

  accountNumberChanged(String v) {
    accountNumber = TextInput.pure(v);
    _validationForm();
  }

  accountTypeChanged(String v) {
    accountType.value = v;
    _validationForm();
  }

  imageChanged() async {
    try {
      final i = await localRepository.pickImage(source: ImageSource.gallery);
      if (i?.path != null) {
        image.value = i!.path!;
        _validationForm();
      }
    } catch (e) {
      logger.d(e);
    }
  }

  _validationForm() {
    final validInputs = <FormzInput>[
      amount,
      senderName,
      orderNumber,
      accountNumber
    ];
    if (argument != null) {
      isFormValidated.value =
          accountType.value.isNotEmpty && Formz.validate(validInputs);
    } else {
      isFormValidated.value = image.value.isNotEmpty &&
          accountType.value.isNotEmpty &&
          Formz.validate(validInputs);
    }
  }

  submittedForm() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      final file = await apiRepostory.uploadFile(localImg: image.value);
      if (file != null) {
        await apiRepostory.addNewPayment(
            amount: int.parse(amount.value),
            senderName: senderName.value,
            orderNumber: int.parse(orderNumber.value),
            accountNumber: int.parse(accountNumber.value),
            accountType: accountType.value,
            image: file);
      }

      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.navigateToBack));
      Get.back();
    } catch (e) {
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              type: GetStateUIActionType.failure, message: e.toString()));
    }
  }

  editForm() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      await apiRepostory.updatePayment(
          amount: int.parse(amount.value),
          senderName: senderName.value,
          orderNumber: int.parse(orderNumber.value),
          accountNumber: int.parse(accountNumber.value),
          accountType: accountType.value,
          id: argument!.payment.id);

      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.navigateToBack));
      Get.back();
    } catch (e) {
      logger.d(e);
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              type: GetStateUIActionType.failure, message: e.toString()));
    }
  }
}
