import 'package:get/get.dart';

import '../data/providers/providers.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class UsersController extends GetxController with StateMixin<List<UserModel>> {
  final GetConnectApiProvider _apiProvider = GetConnectApiProvider();
  @override
  void onInit() {
    super.onInit();
    _apiProvider.getUsers().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      logger.e(err);
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
