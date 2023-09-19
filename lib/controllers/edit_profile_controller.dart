import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/dialogs.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class EditProfileController extends GetxController {
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  final UserRepository userRepository = Get.find<UserRepository>();
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;
  final authenticationController = Get.find<AuthenticationController>();
  final LocalRepository localRepository = Get.find<LocalRepository>();
  RxBool isFormValidated = false.obs;
  RxBool isFormCompanyValidated = false.obs;
  TextInput fname = const TextInput.dirty();
  TextInput lname = const TextInput.pure();
  TextInput username = const TextInput.pure();
  TextInput phoneNumber = const TextInput.pure();
  TextInput cName = const TextInput.pure();
  TextInput cMFname = const TextInput.pure();
  TextInput cMLname = const TextInput.pure();
  TextInput cPhone = const TextInput.pure();
  TextInput cAddress = const TextInput.pure();
  TextInput cCountry = const TextInput.pure();
  TextInput cCiity = const TextInput.pure();
  TextInput cZip = const TextInput.pure();
  TextInput dAddress = const TextInput.pure();
  TextInput dCountry = const TextInput.pure();
  TextInput dCity = const TextInput.pure();
  TextInput dZip = const TextInput.pure();
  RxString profilePic = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    ever(manageUI, (value) {
      switch (value.uiAction.type) {
        case GetStateUIActionType.inProgress:
          LoaderDialog().loaderDialog();
          break;
        case GetStateUIActionType.completed:
          Get.back();

          Alerts.snackBarSuccess(
              title: '', message: value.uiAction.message.toString());

          authenticationController.refreshedUser();
          authenticationController.refreshCompany();
          break;
        case GetStateUIActionType.navigateToBack:
          Get.back();
          break;
        case GetStateUIActionType.navigateToNext:
          break;
        case GetStateUIActionType.failure:
          Get.back();
          Alerts.snackBar(
              title: '', message: value.uiAction.message.toString());
          break;
        default:
      }
    });
  }

  selectPhoto({required ImageSource? imageSource}) async {
    try {
      if (imageSource != null) {
        final image = await localRepository.pickImage(source: imageSource);
        logger.d(image?.path);
        if (image?.path != null) {
          profilePic(image?.path);
          logger.d(profilePic.value);
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  fNameChaged(String v) {
    fname = TextInput.dirty(v);
    _validationForm();
  }

  lNameChaged(String v) {
    lname = TextInput.dirty(v);
    _validationForm();
  }

  usernameChaged(String v) {
    username = TextInput.dirty(v);
    _validationForm();
  }

  phioneNumberChaged(String v) {
    phoneNumber = TextInput.dirty(v);
    _validationForm();
  }

  cNameChaged(String v) {
    cName = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cMFnameChaged(String v) {
    cMFname = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cMLnameChaged(String v) {
    cMLname = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cPhioneNumberChaged(String v) {
    cPhone = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cAddressChaged(String v) {
    cAddress = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cCountryChaged(String v) {
    cCountry = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cCityChaged(String v) {
    cCiity = TextInput.dirty(v);
    _validationConpanyForm();
  }

  cZipChaged(String v) {
    cZip = TextInput.dirty(v);
    _validationConpanyForm();
  }

  dAdressChaged(String v) {
    dAddress = TextInput.dirty(v);
  }

  dCountryChaged(String v) {
    dCountry = TextInput.dirty(v);
  }

  dCityChaged(String v) {
    dCity = TextInput.dirty(v);
  }

  dZipChaged(String v) {
    dZip = TextInput.dirty(v);
  }

  savedProfile() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      String? image;

      if (profilePic.value.isNotEmpty) {
        image = await apiRepostory.uploadFile(localImg: profilePic.value);
      }

      await Future.wait([
        userRepository.updateProfile(
            firstanme: fname.value,
            lastname: lname.value,
            phone: phoneNumber.value,
            username: username.value,
            profilePic: image),
      ]);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Profile updated successfully',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: e.toString(), type: GetStateUIActionType.failure));
    }
  }

  updateCompany() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      final company = CompanyModel(
        companyName: cName.value,
        managerFirstName: cMFname.value,
        managerLastName: cMLname.value,
        companyPhone: cPhone.value,
        companyAddress: cAddress.value,
        companyCountry: cCountry.value,
        companyCity: cCiity.value,
        companyZip: cZip.value,
        deliveryAddress: dAddress.value,
        deliveryCountry: dCountry.value,
        deliveryCity: dCity.value,
        deliveryZip: int.tryParse(dZip.value),
      );
      await userRepository.updateCompany(company: company);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Company updated successfully',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: e.toString(), type: GetStateUIActionType.failure));
    }
  }

  _validationForm() {
    final validInputs = <FormzInput>[
      fname,
      lname,
      username,
      phoneNumber,
    ];

    isFormValidated.value = Formz.validate(validInputs);
  }

  _validationConpanyForm() {
    final validInputs = <FormzInput>[
      cName,
      cMFname,
      cMLname,
      cPhone,
      cAddress,
      cCountry,
      cCiity,
      cZip
    ];

    isFormCompanyValidated.value = Formz.validate(validInputs);
  }
}
