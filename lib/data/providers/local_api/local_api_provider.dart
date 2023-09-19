import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/models.dart';

abstract class LocalApiProvider {
  Future<LocalImgModel?> pickImage({required ImageSource source});
  Future<String?> pickVideo({required ImageSource source});

  Future<String?> getFile();
}
