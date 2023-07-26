// import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class LoaderDialog {
  void loaderDialog() {
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, anim1, anim2) {
        return Dialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: SingleChildScrollView(child: LoadingWidget()),
            ));
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
    // if (Platform.isIOS) {
    //   showCupertinoModalPopup<void>(
    //     barrierDismissible: false,
    //     context: context,
    //     builder: (BuildContext context) => const CupertinoAlertDialog(
    //       content: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    //         child: SingleChildScrollView(child: LoadingWidget()),
    //       ),
    //     ),
    //   );
    // } else {
    //   showGeneralDialog(
    //     barrierLabel: 'Label',
    //     context: context,
    //     barrierDismissible: false,
    //     barrierColor: Colors.black.withOpacity(0.8),
    //     transitionDuration: const Duration(milliseconds: 350),
    //     pageBuilder: (context, anim1, anim2) {
    //       return Dialog(
    //           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //           child: const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    //             child: SingleChildScrollView(child: LoadingWidget()),
    //           ));
    //     },
    //     transitionBuilder: (context, anim1, anim2, child) {
    //       return Transform.scale(
    //         scale: anim1.value,
    //         child: child,
    //       );
    //     },
    //   );
    // }
  }
}
