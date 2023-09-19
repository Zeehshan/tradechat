// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/providers/providers.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/pages/pages.dart';
import '../ui/widgets/snackbar_widget.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class ChatController extends GetxController
    with StateMixin<List<MessageModel>>, ScrollMixin {
  final GetConnectApiProvider _apiProvider = GetConnectApiProvider();
  final AppApiRepostory _apiRepostory = AppApiRepostory();
  final SocketController socketController = Get.find<SocketController>();
  final authController = Get.find<AuthenticationController>();

  Rx<TextEditingController> messageTextController =
      TextEditingController(text: '').obs;

  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  List<MessageModel> messages = [];

  final argument = Get.arguments[0] as ChatPageArgument;

  RxMap<String, double> progressData = <String, double>{}.obs;

  RxBool seningFiles = false.obs;

  RxInt messageActionId = (-1).obs;

  RxInt messageEditActionId = (-1).obs;

  RxBool canSendMessgae = false.obs;

  @override
  void onInit() {
    loadMessages();
    super.onInit();
    logger.d('loadMessages called');
    socketController.socket.emit('join chat room', argument.chatId);
    socketController.socket.on('message event', (data) {
      final chat = MessageModel.fromJson(data);
      addIncommingMessage(chat);
    });

    socketController.socket.on('payment request', (data) {
      final chat = MessageModel.fromJson(data);
      addIncommingMessage(chat);
    });

    socketController.socket.on('send money update', (data) {
      logger.d(data);

      final chat = MessageModel.fromJson(data);
      addIncommingMessage(chat);
    });
    socketController.socket.on('payment request update', (data) {
      logger.i('payment request update', data);
      final paymemntRequest = PaymentRequestModel.fromJson(data);
      final message = messages.firstWhereOrNull(
          (element) => element.paymentRequestId == paymemntRequest.id);
      if (message != null) {
        final chat = message.copyWith(paymentRequest: paymemntRequest);
        final index = messages.map((e) => e.id).toList().indexOf(chat.id);
        messages.removeAt(index);
        messages.insert(index, chat);
        change(messages, status: RxStatus.success());
      }
    });

    socketController.socket.on('message updated', (data) {
      logger.i('updated message', data);
      final msg = MessageModel.fromJson(data);
      final message =
          messages.firstWhereOrNull((element) => element.id == msg.id);
      if (message != null) {
        final index = messages.map((e) => e.id).toList().indexOf(message.id);
        messages.removeAt(index);
        messages.insert(index, msg);
        change(messages, status: RxStatus.success());
      }
    });
    messageTextController.value.addListener(() {
      if (messageTextController.value.text.trim().isNotEmpty) {
        canSendMessgae.value = true;
      } else if (messageEditActionId.value != -1) {
        canSendMessgae.value = true;
      } else {
        if (progressData.isNotEmpty) {
          canSendMessgae.value = true;
        } else {
          canSendMessgae.value = false;
          if (messageActionId.value != -1) {
            messageActionId.value = -1;
          }
        }
      }
    });
    //
  }

  addIncommingMessage(MessageModel message) {
    try {
      messages.insert(0, message);
      change(messages, status: RxStatus.success());
      try {
        if (scroll.hasClients == true) {
          scroll.animateTo(0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        }
      } catch (e) {
        ///
      }
    } catch (e) {
      logger.e(e);
    }
  }

  loadMessages() {
    _apiProvider.getMesssages(chatId: argument.chatId, page: page).then(
        (response) {
      final list = response;
      final bool emptyMessages = list.isEmpty;
      if (!getFirstData && emptyMessages) {
        change(null, status: RxStatus.empty());
        lastPage = true;
      } else if (getFirstData && emptyMessages) {
        lastPage = true;
      } else {
        getFirstData = true;
        if (page == 1) {
          messages = response;
        } else {
          messages.addAll(response);
        }
        change(messages, status: RxStatus.success());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  Future<void> onEndScroll() async {
    logger.i('onEndScroll');
    if (!lastPage) {
      page += 1;
      await loadMessages();
    } else {}
  }

  @override
  Future<void> onTopScroll() async {
    logger.i('onTopScroll');
  }

  sendChatMessage() {
    if (messageEditActionId.value != -1) {
      messageTextEdit();
    } else if (messageActionId.value != -1) {
      sendReply(messageTextController.value.text, progressData.keys.toList());
    } else if (progressData.isNotEmpty) {
      sendFiles(messageTextController.value.text, progressData.keys.toList());
    } else {
      socketController.socket.emit('chat message', {
        'chatId': argument.chatId,
        'senderId': authController.profile.value.user!.id,
        'text': messageTextController.value.text
      });
    }
  }

  sendPaymentRequest(String amount) {
    socketController.socket.emit('payment request', {
      'requesterId': authController.profile.value.user!.id,
      'requesteeId': argument.peerId,
      'amount': amount,
      'chatId': argument.chatId
    });
  }

  acceptedPaymentRequest(
      int paymentId, int chatId, BuildContext context) async {
    final amount = messages
        .firstWhereOrNull((element) => element.paymentRequestId == paymentId);
    if (amount != null) {
      await authController.refreshedUser();
      final companyBalance =
          authController.profile.value.user?.companyWalletBalance ?? 0;
      final personalBalance =
          authController.profile.value.user?.personalWalletBalance ?? 0;
      if ((companyBalance + personalBalance) <
          int.parse(amount.paymentRequest!.amount)) {
        SnackBarWidget().showError(
            context: context,
            error: 'You dont have sufficient balance in your wallet');
      } else {
        socketController.socket.emit('payment request update',
            {'requestId': paymentId, 'status': 'accepted', 'chatId': chatId});
      }
    }
  }

  rejectedPaymentRequest(int paymentId, int chatId) {
    logger.d('rejectedPaymentRequest');
    socketController.socket.emit('payment request update',
        {'requestId': paymentId, 'status': 'rejected', 'chatId': chatId});
  }

  sendFiles(String message, List<String> files) async {
    seningFiles.value = true;
    canSendMessgae.value = false;
    final keys = files;
    for (final data in keys) {
      final _uploadedfile = await _apiRepostory.uploadFile(
        localImg: data,
        onReceiveProgress: (file, progress) {
          logger.i(progress);
          progressData[file] = progress;
        },
      );
      socketController.socket.emit('chat message', {
        'chatId': argument.chatId,
        'senderId': authController.profile.value.user!.id,
        'fileUrl': _uploadedfile,
        'text': ''
      });
      canSendMessgae.value = false;

      progressData.remove(data);
      if (progressData.isEmpty && message.isNotEmpty) {
        seningFiles.value = false;
        socketController.socket.emit('chat message', {
          'chatId': argument.chatId,
          'senderId': authController.profile.value.user!.id,
          'text': message
        });
      } else if (message.isEmpty && progressData.isEmpty) {
        seningFiles.value = false;
      }
    }
  }

  addFileToView(String file) {
    progressData[file] = 0.0;
    canSendMessgae.value = true;
  }

  selectMessage(int id) {
    messageEditActionId.value = id;
    final message = messages.firstWhereOrNull((element) => element.id == id);
    messageTextController.value = TextEditingController(text: message?.text);
    canSendMessgae.value = true;
  }

  deleteMessage(MessageModel msg) {
    socketController.socket.emit('update message', {
      'quoteToId': null,
      'id': msg.id,
      'chatId': argument.chatId,
      'text': msg.text,
      'isDeleted': true,
    });
  }

  messageTextEdit() {
    socketController.socket.emit('update message', {
      'quoteToId': null,
      'id': messageEditActionId.value,
      'chatId': argument.chatId,
      'text': messageTextController.value.text,
      'isDeleted': false,
    });
    messageEditActionId.value = -1;
  }

  replyChanged(int? msgId) {
    if (msgId != null) {
      messageActionId.value = msgId;
      canSendMessgae.value = false;
    } else {
      messageActionId.value = -1;
      messageTextController.value.clear();
      canSendMessgae.value = false;
      progressData.clear();
    }
  }

  sendReply(String message, List<String> files) async {
    logger.i('Reply sending....');
    final keys = files;
    if (keys.isNotEmpty) {
      seningFiles.value = true;
      canSendMessgae.value = false;
      for (final data in keys) {
        final _uploadedfile = await _apiRepostory.uploadFile(
          localImg: data,
          onReceiveProgress: (file, progress) {
            logger.i(progress);
            progressData[file] = progress;
          },
        );
        socketController.socket.emit('chat message', {
          'quoteToId': messageActionId.value,
          'chatId': argument.chatId,
          'senderId': authController.profile.value.user!.id,
          'fileUrl': _uploadedfile,
          'text': '',
        });
        canSendMessgae.value = false;

        progressData.remove(data);
        if (progressData.isEmpty && message.isNotEmpty) {
          seningFiles.value = false;
          socketController.socket.emit('chat message', {
            'quoteToId': messageActionId.value,
            'chatId': argument.chatId,
            'senderId': authController.profile.value.user!.id,
            'text': message
          });
        } else if (message.isEmpty && progressData.isEmpty) {
          seningFiles.value = false;
        }
      }
    } else {
      canSendMessgae.value = false;
      socketController.socket.emit('chat message', {
        'quoteToId': messageActionId.value,
        'chatId': argument.chatId,
        'senderId': authController.profile.value.user!.id,
        'text': message
      });
    }
    messageActionId.value = -1;
  }

  sendMoney(String amount, BuildContext context) async {
    await authController.refreshedUser();
    final companyBalance =
        authController.profile.value.user?.companyWalletBalance ?? 0;
    final personalBalance =
        authController.profile.value.user?.personalWalletBalance ?? 0;
    if ((companyBalance + personalBalance) < int.parse(amount)) {
      SnackBarWidget().showError(
          context: context,
          error: 'You dont have sufficient balance in your wallet');
    } else {
      socketController.socket.emit('send money', {
        'requesterId': authController.profile.value.user!.id,
        'moneyToUserId': argument.peerId,
        'amount': amount,
        'chatId': argument.chatId
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    socketController.socket.emit('leave chat room', argument.chatId);
    messageTextController.value.dispose();
  }
}
