import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'application.dart';
import 'data/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const Application());
}

Future<void> initServices() async {
  Get.put<UserApiProvider>(
    UserApiHttpProvider(),
    permanent: true,
  );
  Get.put<LocalApiProvider>(
    LocalApiGalleryProvider(),
    permanent: true,
  );
}
