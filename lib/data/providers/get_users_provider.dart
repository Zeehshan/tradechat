import 'package:get/get.dart';

class GetUsersProvider extends GetConnect {
  Future<dynamic> getUsers() async {
    final response = await get('http://54.169.73.169:3000/api/auth/users');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
