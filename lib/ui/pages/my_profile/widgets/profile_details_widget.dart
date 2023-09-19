import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../configs/routes/app_routes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class PrlofileDetailsWidget extends StatelessWidget {
  const PrlofileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthenticationController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //       blurRadius: 1,
        //       spreadRadius: 1,
        //       color: Colors.grey.withOpacity(.2),
        //       offset: const Offset(0, 0))
        // ]
      ),
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.editProfile,
            arguments: EditProfilePageAruguments(isforProfile: true)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Obx(() => Row(
                children: [
                  NetworkImageWidget(
                    borderRadius: 2,
                    width: 80,
                    height: 80,
                    imageUrl:
                        Tools.displayImage(auth.profile.value.user?.profilePic),
                    userId: auth.profile.value.user?.id.toString(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                            text:
                                '${auth.profile.value.user?.firstName} ${auth.profile.value.user?.lastName}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 18))),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                            text: 'Username: ',
                            style: Theme.of(context).textTheme.labelMedium,
                            children: [
                              TextSpan(
                                  text: '${auth.profile.value.user?.username}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14))
                            ])),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                            text: 'User id: ',
                            style: Theme.of(context).textTheme.labelMedium,
                            children: [
                              TextSpan(
                                  text: '${auth.profile.value.user?.id}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14))
                            ])),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
