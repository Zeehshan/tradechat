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
  Future updateProfile({
    String? firstanme,
    String? lastname,
    String? phone,
    String? username,
    String? profilePic,
  }) async {
    try {
      String path = BackendApis.updateProfile;
      final data = <String, dynamic>{
        'firstName': firstanme,
        'lastName': lastname,
        'username': username,
        'profilePic': profilePic,
      };
      if (phone != null) {
        try {
          String phone0 = phone.replaceAll('+', '00');
          data['phoneNumber'] = int.tryParse(phone0);
        } catch (e) {
          data['phoneNumber'] = int.tryParse(phone);
        }
      }
      data.removeWhere((key, value) => value == null);
      final response = await backendApiReq.put(path, data: jsonEncode(data));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CompanyModel> getCompany() async {
    try {
      const path = BackendApis.company;
      final response = await backendApiReq.get(path);
      final companyModel = CompanyModel.fromJson(response.data);
      return companyModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateCompany({required CompanyModel company}) async {
    try {
      const path = BackendApis.company;
      final data = company.toJson();
      data.removeWhere((key, value) => value == null);
      await backendApiReq.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
