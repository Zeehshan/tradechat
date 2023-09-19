import 'dart:convert';

import 'package:get/get.dart';

import '../../../configs/apis/apis.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';

class GetConnectApiProvider extends GetConnect {
  final SecureStorage _secureStorage = SecureStorage();

  Future<List<UserModel>> getUsers() async {
    final String? _authenticationToken =
        await _secureStorage.getAuthenticationToken();
    final response =
        await get(BackendApis.baseUrl + BackendApis.users, headers: {
      'Authorization': 'Bearer $_authenticationToken',
      'Content-Type': 'application/json'
    });
    if (response.status.hasError) {
      return Future.error(response.statusText ?? '');
    } else {
      if (response.bodyString == null) {
        return [];
      }
      return (jsonDecode(response.bodyString!)['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e))
          .toList();
    }
  }

  Future<Map<String, dynamic>> getChats() async {
    try {
      final String? _authenticationToken =
          await _secureStorage.getAuthenticationToken();
      final response =
          await get(BackendApis.baseUrl + BackendApis.chat, headers: {
        'Authorization': 'Bearer $_authenticationToken',
        'Content-Type': 'application/json'
      });
      if (response.status.hasError) {
        return Future.error(response.statusText ?? '');
      } else {
        if (response.bodyString == null) {
          return {};
        }
        final data = jsonDecode(response.bodyString!);
        logger.d(data);
        final chats = data['chats'] as List<dynamic>;

        logger.d(chats[0].runtimeType);
        List<ChatModel> chats0 = [];
        try {
          chats0 = chats.map((json) => ChatModel.fromJson(json)).toList();
        } catch (e) {
          logger.i(e);
        }
        final data0 = data;
        data0['chats'] = chats0;
        logger.d(data0);

        return data0;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessageModel>> getMesssages(
      {required int chatId, int page = 1}) async {
    try {
      final String? _authenticationToken =
          await _secureStorage.getAuthenticationToken();
      final response = await get(
          BackendApis.baseUrl +
              ('${BackendApis.messages.replaceAll('{chatId}', chatId.toString())}?page=$page'),
          headers: {
            'Authorization': 'Bearer $_authenticationToken',
            'Content-Type': 'application/json'
          });
      if (response.status.hasError) {
        return Future.error(response.statusText ?? '');
      } else {
        if (response.bodyString == null) {
          return [];
        }
        final data = jsonDecode(response.bodyString!);
        final chats = data['messages'] as List<dynamic>;
        logger.d(chats[0].runtimeType);
        List<MessageModel> chats0 = [];
        try {
          chats0 = chats.map((json) => MessageModel.fromJson(json)).toList();
        } catch (e) {
          logger.i(e);
        }

        return chats0;
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<PaymentModel>> payments() async {
    try {
      final String? _authenticationToken =
          await _secureStorage.getAuthenticationToken();
      final response =
          await get(BackendApis.baseUrl + BackendApis.newPayment, headers: {
        'Authorization': 'Bearer $_authenticationToken',
        'Content-Type': 'application/json'
      });
      if (response.status.hasError) {
        return Future.error(response.statusText ?? '');
      } else {
        if (response.bodyString == null) {
          return [];
        }
        final data = jsonDecode(response.bodyString!);
        final payments = data as List<dynamic>;

        final payments0 =
            payments.map((json) => PaymentModel.fromJson(json)).toList();
        return payments0;
      }
    } catch (e) {
      logger.e(e);

      return [];
    }
  }
}
