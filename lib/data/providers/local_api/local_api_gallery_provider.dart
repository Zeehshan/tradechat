import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/models.dart';
import '../providers.dart';

class LocalApiGalleryProvider implements LocalApiProvider {
  @override
  Future<LocalImgModel?> pickImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) {
        return null;
      }
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(
          ratioX: 1.0,
          ratioY: 1.0,
        ),
        compressQuality: 100,
        maxWidth: 1000,
        maxHeight: 1000,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop photo',
              // lockAspectRatio: f,
              // hideBottomControls: true,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(title: 'Crop photo', aspectRatioLockEnabled: true)
        ],
      );
      final localImg = LocalImgModel(
          path: croppedFile?.path,
          type: pickedFile.mimeType,
          name: pickedFile.name);
      return localImg;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> pickVideo({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickVideo(source: source);
      if (pickedFile == null) {
        return null;
      } else {
        return pickedFile.path;
      }
    } catch (e) {
      rethrow;
    }
  }
}
