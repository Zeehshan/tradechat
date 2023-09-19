import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/providers/providers.dart';
import '../utils/utils.dart';
import 'package:path/path.dart' as path;

class DownLoadController extends GetxController {
  RxInt percent = 0.obs;
  RxDouble progress = 0.0.obs;

  RxBool loading = false.obs;

  downloadStart(String file) async {
    try {
      loading.value = true;
      await [Permission.storage].request();
      percent.value = 0;
      progress.value = 0.0;
      var appPath = Platform.isAndroid
          ? (await getExternalStorageDirectory() ??
              await getApplicationSupportDirectory())
          : await getApplicationDocumentsDirectory();

      String directoryPath = appPath.path;
      await Directory(directoryPath).create(recursive: true);

      final filename = path.basename(file);
      String filePath = '$directoryPath/$filename';
      logger.d(Tools.displayImage(file));
      await Dio().download(Tools.displayImage(file), filePath,
          onReceiveProgress: (sentBytes, totalBytes) async {
        double __progressValue =
            Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);
        __progressValue = double.parse(__progressValue.toStringAsFixed(2));
        progress.value = __progressValue;
        percent.value = (__progressValue * 100.0).toInt();
      });
      Get.back();
      await OpenFile.open(filePath);
      loading.value = false;
    } catch (e) {
      logger.d(e);
      percent.value = 0;
      progress.value = 0.0;
      loading.value = false;
    }
  }
}
