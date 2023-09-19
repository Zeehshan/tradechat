// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controllers/controllers.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';

class MenueWidget extends StatefulWidget {
  const MenueWidget({super.key});

  @override
  State<MenueWidget> createState() => _MenueWidgetState();
}

class _MenueWidgetState extends State<MenueWidget> {
  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.add),
      ),
      onTap: () => _showPopupMenu(context),
    );
  }

  _showPopupMenu(BuildContext context) async {
    final auth = Get.find<AuthenticationController>();
    Offset offs = Offset(1, (MediaQuery.of(context).size.height));
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offs, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero) + offs,
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final List<MenueModel> menues = [
      MenueModel(icon: Icons.photo, title: 'Add Photo', id: 0),
      MenueModel(icon: Icons.video_call_rounded, title: 'Add Video', id: 1),
      MenueModel(icon: Icons.file_present_rounded, title: 'Add File', id: 2),
      MenueModel(icon: Icons.currency_yuan_rounded, title: 'Send Money', id: 3),
      MenueModel(
          icon: Icons.currency_yuan_rounded, title: 'Request Mondey', id: 4),
    ];
    await showMenu(
      context: context,
      position: position,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      items: menues
          .map(
            (e) => PopupMenuItem(
              onTap: () {
                Future.delayed(Duration.zero, () async {
                  switch (e.id) {
                    case 0:
                      final file = await LocalRepository()
                          .pickImage(source: ImageSource.gallery);
                      if (file != null) {
                        chatController.addFileToView(file.path!);
                      }
                      break;

                    case 1:
                      final file = await LocalRepository()
                          .pickVideo(source: ImageSource.gallery);
                      if (file != null) {
                        chatController.addFileToView(file);
                      }
                      break;
                    case 2:
                      final file = await LocalRepository().getFile();
                      if (file != null) {
                        chatController.addFileToView(file);
                      }
                      break;
                    case 3:
                      final String? amount =
                          await InputPaymentDialog.inputPaymentDialog(
                              context: context,
                              message: 'Enter amount to send');
                      if (amount != null) {
                        final String? password =
                            await InputPaymentDialog.inputPaymentDialog(
                                context: context,
                                message: 'Enter payment password');
                        if (password != null &&
                            password ==
                                auth.profile.value.user?.settings?.password) {
                          chatController.sendMoney(amount, context);
                        } else {
                          SnackBarWidget().showError(
                              context: context,
                              error: 'Payment password not matched');
                        }
                      }
                      break;
                    case 4:
                      final String? amount =
                          await InputPaymentDialog.inputPaymentDialog(
                              context: context,
                              message: 'Enter amount for request');
                      if (amount != null) {
                        chatController.sendPaymentRequest(amount);
                      }
                      break;
                  }
                });
              },
              child: Row(
                children: [
                  Icon(
                    e.icon,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    e.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      elevation: 8.0,
    );
  }

  Widget adaptiveAction(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }
}

class MenueModel {
  final IconData icon;
  final String title;
  final int id;

  MenueModel({required this.icon, required this.title, required this.id});
}
