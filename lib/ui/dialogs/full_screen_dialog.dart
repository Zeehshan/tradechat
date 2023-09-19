import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class FullScreenDialog {
  static fullScreenDialog(
      {required BuildContext context, required String image}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                AppBarWidget(
                  title: const Text(''),
                  backButtonCallback: () => Navigator.pop(context),
                ),
                Expanded(
                  child: ZoomInOutImageWidget(
                    path: image,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
