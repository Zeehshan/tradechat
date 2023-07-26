import '../../models/models.dart';
import '../providers/providers.dart';

class UserRepository {
  final UserApiProvider userApiProvider;
  UserRepository() : userApiProvider = UserApiHttpProvider();

  Future<ProfileModel?> login(
      {required String email, required String password}) async {
    try {
      return await userApiProvider.login(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future signup({required String email, required String password}) async {
    try {
      return await userApiProvider.signup(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileModel?> profile() async {
    try {
      return await userApiProvider.profile();
    } catch (e) {
      rethrow;
    }
  }

  Future forgotPassword({required String email}) async {
    try {
      return await userApiProvider.forgotPassword(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future resetPassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      return await userApiProvider.resetPassword(
          oldPassword: oldPassword, newPassword: newPassword);
    } catch (e) {
      rethrow;
    }
  }

  Future updateProfile(
      {String? firstanme,
      String? lastname,
      String? phone,
      String? username}) async {
    try {
      return await userApiProvider.updateProfile(
          firstanme: firstanme,
          lastname: lastname,
          phone: phone,
          username: username);
    } catch (e) {
      rethrow;
    }
  }
}
