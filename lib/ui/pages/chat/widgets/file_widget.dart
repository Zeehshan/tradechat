import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';
import 'package:path/path.dart' as path;

class FileWidget extends StatelessWidget {
  final MessageModel message;
  final bool fromCurrentUser;
  const FileWidget(
      {super.key, required this.message, required this.fromCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          if (message.fileUrl!.toLowerCase().contains('png') ||
              message.fileUrl!.toLowerCase().contains('jpg') ||
              message.fileUrl!.toLowerCase().contains('jpeg')) {
            return Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .6),
              child: NetworkImageWidget(
                  onPressed: () {
                    FullScreenDialog.fullScreenDialog(
                        context: context,
                        image: Tools.displayImage(message.fileUrl!));
                  },
                  boxFit: BoxFit.fitWidth,
                  borderRadius: 0,
                  imageUrl: Tools.displayImage(message.fileUrl!)),
            );
          }
          return Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () =>
                    FileDialog.fileDialog(context: context, message: message),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fileIcon(path.extension(message.fileUrl!)),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(
                        path.basename(message.fileUrl!),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color:
                                fromCurrentUser ? Colors.white : Colors.black,
                            fontSize: 14),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        if (message.fileUrl!.toLowerCase().contains('png') ||
            message.fileUrl!.toLowerCase().contains('jpg') ||
            message.fileUrl!.toLowerCase().contains('jpeg'))
          const SizedBox(
            height: 8,
          ),
        if (message.fileUrl!.toLowerCase().contains('png') ||
            message.fileUrl!.toLowerCase().contains('jpg') ||
            message.fileUrl!.toLowerCase().contains('jpeg'))
          Text(
            message.text,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: fromCurrentUser ? Colors.white : Colors.black,
                fontSize: 14),
          ),
        if (message.fileUrl!.toLowerCase().contains('png') ||
            message.fileUrl!.toLowerCase().contains('jpg') ||
            message.fileUrl!.toLowerCase().contains('jpeg'))
          const SizedBox(
            height: 4,
          ),
      ],
    );
  }
}
