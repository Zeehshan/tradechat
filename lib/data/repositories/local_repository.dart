import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';
import '../providers/providers.dart';

class LocalRepository {
  final LocalApiProvider localApiProvider;
  LocalRepository() : localApiProvider = LocalApiGalleryProvider();

  Future<LocalImgModel?> pickImage({required ImageSource source}) async {
    try {
      return await localApiProvider.pickImage(source: source);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> pickVideo({required ImageSource source}) async {
    try {
      return await localApiProvider.pickVideo(source: source);
    } catch (e) {
      rethrow;
    }
  }
}
