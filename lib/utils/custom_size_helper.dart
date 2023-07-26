import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizeHelper {
  static double toolbarHeight(
    BuildContext context,
  ) {
    return MediaQuery.of(context).size.height * .07;
  }

  static double bottomHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * .07;
    // return MediaQuery.of(context).size.height * .03;
  }

  static double marginHorizontal(BuildContext context) {
    return 25;
  }
}
