import 'dart:convert';

import '../../../configs/apis/apis.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../providers.dart';

class UserApiHttpProvider extends BaseApiProvider implements UserApiProvider {
  @override
  Future forgotPassword({required String email}) async {
    try {
      String path = BackendApis.forgotPassword;
      final response =
          await backendApiReq.post(path, data: jsonEncode({'email': email}));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileModel?> login(
      {required String email, required String password}) async {
    try {
      String path = BackendApis.login;
      final data = {'email': email, 'password': password};
      final response = await backendApiReq.post(path, data: jsonEncode(data));
      SecureStorage()
          .setAuthenticationToken(authenticationToken: response.data['token']);
      SecureStorage().setLoggedInUser(response.data);

      final profile = ProfileModel.fromJson(response.data);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileModel?> profile() async {
    try {
      String path = BackendApis.profile;
      final response = await backendApiReq.get(path);
      final profile = ProfileModel.fromJson(response.data);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future resetPassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      String path = BackendApis.resetPassword;
      final data = {'old_password': oldPassword, 'new_password': newPassword};
      final response = await backendApiReq.post(path, data: jsonEncode(data));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signup({required String email, required String password}) async {
    try {
      String path = BackendApis.signUp;
      final data = {'email': email, 'password': password};
      final response = await backendApiReq.post(path, data: jsonEncode(data));
      SecureStorage()
          .setAuthenticationToken(authenticationToken: response.data['token']);
      SecureStorage().setLoggedInUser(response.data);
      final profile = ProfileModel.fromJson(response.data);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateProfile(
      {String? firstanme,
      String? lastname,
      String? phone,
      String? username}) async {
    try {
      String path = BackendApis.updateProfile;
      final data = <String, dynamic>{
        'firstName': firstanme,
        'lastName': lastname,
        'username': 'mahin'
      };
      if (phone != null) {
        String phone0 = phone.replaceAll('+', '00');
        data['phoneNumber'] = int.tryParse(phone0);
      }
      data.removeWhere((key, value) => value == null);
      final response = await backendApiReq.post(path, data: jsonEncode(data));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
