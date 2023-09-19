import 'package:get/get.dart';

import '../configs/routes/app_routes.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class AuthenticationController extends GetxController {
  RxBool isUserAuthenticated = false.obs;
  final UserRepository _userRepository = Get.find();
  final SecureStorage secureStorage = SecureStorage();
  Rx<ProfileModel> profile = ProfileModel(user: null).obs;
  Rx<CompanyModel> company = CompanyModel().obs;

  ///
  final myOrderController = Get.find<MyOrdersController>();
  final chatController = Get.find<ChatsController>();
  final socketController = Get.find<SocketController>();

  ///
  @override
  void onInit() async {
    ever(isUserAuthenticated, handleAuthenticationChanged);
    isUserAuthenticated.value = await getAuthenticatedStatus();
    super.onInit();
  }

  void handleAuthenticationChanged(
    bool isUserAuthenticated,
  ) async {
    // TEST: go to HOME, skip public area (login, register, etc...)
    // Get.offAllNamed(AppRoutes.home);

    if (isUserAuthenticated == false) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      socketController.connectSocket();
      chatController.loadChats();
      myOrderController.myorders();

      Get.offAllNamed(AppRoutes.scaffolNavbar);
      refreshCompany();
    }
  }

  void logout() async {
    try {
      secureStorage.deleteAuthenticationToken();
      handleAuthenticationChanged(false);
    } catch (exception) {
      //
    }
  }

  Future<bool> getAuthenticatedStatus() async {
    try {
      final user = await secureStorage.getLoggedInUser();
      if (user != null) {
        final _user = await _userRepository.profile();
        if (_user != null) {
          profile.value = _user;
          return true;
        }
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future refreshedUser() async {
    try {
      final _user = await _userRepository.profile();
      if (_user != null) {
        profile.value = _user;
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future refreshCompany() async {
    try {
      final _company = await _userRepository.getCompany();
      company.value = _company;
    } catch (e) {
      logger.e(e);
    }
  }

  updatePassword(String password) async {
    try {
      await _userRepository.updatePaymentPassowrd(password: password);
      refreshedUser();
    } catch (e) {
      logger.e(e);
    }
  }
}
