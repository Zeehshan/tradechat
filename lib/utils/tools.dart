import 'package:intl/intl.dart';

import '../configs/apis/apis.dart';

class Tools {
  static displayImage(String? filename) {
    if (filename == null) return null;
    return BackendApis.baseUrl + BackendApis.displayFile + filename;
  }

  static numberFormat(String amount) {
    return NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
        .format(double.parse(amount));
  }
}
