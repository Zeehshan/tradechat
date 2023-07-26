import '../configs/apis/apis.dart';

class Tools {
  static displayImage(String? filename) {
    if (filename == null) return null;
    return BackendApis.baseUrl + BackendApis.displayFile + filename;
  }
}
