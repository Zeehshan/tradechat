import 'package:get/get.dart';

import '../data/providers/providers.dart';
import '../data/repositories/app_api_repository.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ChatsController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  final GetConnectApiProvider _apiProvider = GetConnectApiProvider();

  final AppApiRepostory apiRepostory = AppApiRepostory();
  Map<String, dynamic> chats = {};

  loadChats() {
    _apiProvider.getChats().then((response) {
      chats = response;
      change(chats, status: RxStatus.success());
    }, onError: (err) {
      logger.e(err);
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  deleChat(int id) async {
    try {
      apiRepostory.deleteChat(id: id);
      List<ChatModel> chats0 = (chats['chats'] ?? []);
      chats0.removeWhere((element) => element.id == id);
      chats['chats'] = chats0;
      change(chats, status: RxStatus.success());
    } catch (e) {
      //
    }
  }
}
