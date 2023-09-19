// ignore_for_file: prefer_contains, depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../configs/routes/assets_path.dart';
import '../../controllers/controllers.dart';
import 'widgets.dart';

class UserImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? width, height, borderRadius;
  final String? localImage;
  final String? userId;
  final BoxFit? boxFit;

  /// when imad null
  final String? firstLaller;
  final Function()? onPressed;
  const UserImageWidget(
      {Key? key,
      required this.imageUrl,
      this.width,
      this.height,
      this.borderRadius = 18,
      this.localImage,
      this.userId,
      this.boxFit,
      this.firstLaller,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUserid = Get.find<AuthenticationController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 18),
      child: GestureDetector(
        onTap: onPressed ??
            (userId == null
                ? null
                : currentUserid.profile.value.user?.id ==
                        int.tryParse(userId ?? '')
                    ? null
                    : () async {}),
        child: imageUrl?.contains('.svg') == true
            ? SizedBox(
                width: width,
                height: height,
                child: SvgPicture.network(
                  imageUrl!,
                  fit: boxFit ?? BoxFit.cover,
                  width: width,
                  height: height,
                ),
              )
            : CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                width: width,
                height: height,
                alignment: Alignment.center,
                fit: boxFit ?? BoxFit.cover,
                // imageBuilder: (context, imageProvider) => Container(
                //   width: width,
                //   height: height,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: imageProvider,
                //       fit: boxFit ?? BoxFit.cover,
                //     ),
                //   ),
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                //     child: userId == null
                //         ? null
                //         : Container(
                //             decoration: BoxDecoration(
                //                 color: Colors.white.withOpacity(0.0)),
                //           ),
                //   ),
                // ),
                placeholder: (context, url) => userId != null
                    ? Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                            color: const Color(0xffCDD8E0),
                            borderRadius:
                                BorderRadius.circular(borderRadius ?? 12)),
                        child: Center(
                          child: SvgPicture.asset(
                            AssetsPath.profile,
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(child: LoadingWidget()),
                      ),
                errorWidget: (context, url, error) => Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: const Color(0xffCDD8E0),
                      borderRadius: BorderRadius.circular(borderRadius ?? 12)),
                  child: Center(
                    child: firstLaller != null
                        ? Text(
                            firstLaller!.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        : SvgPicture.asset(
                            AssetsPath.profile,
                          ),
                  ),
                ),
              ),
      ),
    );
  }
}
