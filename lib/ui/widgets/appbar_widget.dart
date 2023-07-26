import 'package:flutter/material.dart';
import 'package:tradechat/configs/themes/themes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget> actions;
  final double toolbarHeight;
  final Color? backgroundColor, leadingIconColor;
  final VoidCallback? backButtonCallback;
  final bool? centerTitle;

  const AppBarWidget(
      {Key? key,
      this.title,
      this.actions = const [],
      this.toolbarHeight = kToolbarHeight,
      this.backgroundColor,
      this.backButtonCallback,
      this.leadingIconColor,
      this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      elevation: 0,
      leadingWidth: 60,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? Colors.transparent,
      titleSpacing: 0,
      iconTheme: const IconThemeData(color: ThemeConfig.primaryColor),
      leading: (backButtonCallback != null)
          ? InkWell(
              onTap: backButtonCallback,
              child: const Icon(Icons.arrow_back_ios_new_sharp))
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
