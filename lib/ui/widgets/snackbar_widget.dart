import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'widgets.dart';

class SnackBarWidget {
  // TODO
  void showNoInternetBanner({required BuildContext context}) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('No Internet connection'),
        leading: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        actions: [Text('a')],
      ),
    );
  }

  void showSuccess(
      {required String message, required BuildContext context}) async {
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   backgroundColor: Colors.green,
    //   textColor: Colors.white,
    // );
    showAlertBanner(
      context,
      () {},
      ExampleAlertBannerChild(
        backgroundColor: const Color(0xff4E8D7C),
        message: message,
      ),
      alertBannerLocation: AlertBannerLocation.top,
      // .. EDIT MORE FIELDS HERE ...
    );
  }

  showInfo({required String message, required BuildContext context}) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   backgroundColor: Colors.lightBlueAccent,
    //   textColor: Colors.white,
    // );
    showAlertBanner(
      context,
      () {},
      ExampleAlertBannerChild(
        backgroundColor: const Color(0xff3282B8),
        message: message,
      ),
      alertBannerLocation: AlertBannerLocation.top,
      // .. EDIT MORE FIELDS HERE ...
    );
    // Flushbar(
    //   message: message,
    //   messageColor: Colors.white,
    //   backgroundColor: Colors.lightBlueAccent,
    //   duration: const Duration(microseconds: 2000),
    //   icon: TextButton(
    //     onPressed: () => flush!.dismiss(true),
    //     child: const Text('Ok'),
    //   ),
    // ).show(navigator.context);
  }

  void showWarning(
      {required String message, required BuildContext context}) async {
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_LONG,
    //   backgroundColor: Colors.brown.shade200,
    //   textColor: Colors.white,
    // );
    showAlertBanner(
      context,
      () {},
      ExampleAlertBannerChild(
        backgroundColor: const Color(0xffEF8D32),
        message: message,
      ),
      alertBannerLocation: AlertBannerLocation.top,
      // .. EDIT MORE FIELDS HERE ...
    );
  }

  void showError({String? error, required BuildContext context}) async {
    // Fluttertoast.showToast(
    //   msg: error ?? t.MESSAGES.TEXT__FAILED_MESSAGE, // TODO
    //   toastLength: Toast.LENGTH_LONG,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    // );

    showAlertBanner(
      context,
      () {},
      ExampleAlertBannerChild(
        backgroundColor: const Color(0xffDB3056),
        message: error ?? 'Something went wrong try again',
      ),
      alertBannerLocation: AlertBannerLocation.top,
      // .. EDIT MORE FIELDS HERE ...
    );
  }

  // void cancelToast() {
  //   Fluttertoast.cancel();
  // }
}

// Example child of alert banner
class ExampleAlertBannerChild extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  const ExampleAlertBannerChild({
    super.key,
    required this.message,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     children: [
                    //       SvgPicture.asset(
                    //         AssetsPath.alertChecked,
                    //         colorFilter: ColorFilter.mode(
                    //             Colors.white.withOpacity(.5), BlendMode.srcIn),
                    //       ),
                    //       SvgPicture.asset(
                    //         AssetsPath.check,
                    //         height: 10,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            message,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(right: 14, top: 14),
                      child: Icon(
                        Icons.clear,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
